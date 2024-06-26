//
//  AppConfigurations.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import Foundation

final class AppConfiguration {
    lazy var apiBaseURL: String = {
        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as? String else {
            fatalError("ApiBaseURL must not be empty in plist")
        }

        return apiBaseURL
    }()
}
