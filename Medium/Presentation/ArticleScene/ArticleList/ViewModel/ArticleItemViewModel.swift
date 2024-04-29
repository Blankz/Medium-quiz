//
//  ArticleItemViewModel.swift
//  Medium
//
//  Created by Blank on 29/4/2567 BE.
//

import Foundation
import UIKit

final class ArticleItemViewModel {
    let title: String
    let link: String
    let creator: String
    let creatorIcon: URL?
    let content: String
    let thumbnail: URL?
    let publishDate: String
    
    init(_ item: ArticleItem) {
        self.title = item.title
        self.link = item.link
        self.creator = item.creator
        self.creatorIcon = URL(string: item.creatorIcon)
        self.content = item.content
        self.thumbnail = URL(string: extractImageURL(from: item.content) ?? "")
        if let publishDate = item.publishDate {
            self.publishDate = dateFormatter.string(from: publishDate )
        } else {
            self.publishDate = ""
        }
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.calendar = Calendar(identifier: .iso8601)
        return formatter
    }()
}

private func extractImageURL(from htmlString: String) -> String? {
    do {
        let regex = try NSRegularExpression(pattern: "<img[^>]+src=\"([^\"]+)\"", options: [])
        if let match = regex.firstMatch(in: htmlString, options: [], range: NSRange(location: 0, length: htmlString.utf16.count)) {
            let imageUrlRange = match.range(at: 1)
            if let imageUrlRange = Range(imageUrlRange, in: htmlString) {
                return String(htmlString[imageUrlRange])
            }
        }
        return nil
    } catch {
        return nil
    }
}
