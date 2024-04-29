//
//  Cache.swift
//  Medium
//
//  Created by Blank on 29/4/2567 BE.
//

import Foundation
protocol CacheDataProtocol {
    func loadObjectFromUserDefaults<T: Codable>(_ type: T.Type, forKey key: String) -> T?
    func saveObjectToUserDefaults<T: Codable>(_ object: T, forKey key: String)
}

class CacheData: CacheDataProtocol {

    func loadObjectFromUserDefaults<T: Codable>(_ type: T.Type, forKey key: String) -> T? {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                let decoder = JSONDecoder()
                let object = try decoder.decode(T.self, from: data)
                return object
            } catch {
                print("Error loading object from UserDefaults:", error)
                return nil
            }
        }
        return nil
    }

    func saveObjectToUserDefaults<T: Codable>(_ object: T, forKey key: String) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(object)
            UserDefaults.standard.set(data, forKey: key)
            print("Object saved to UserDefaults")
        } catch {
            print("Error saving object to UserDefaults:", error)
        }
    }
}
