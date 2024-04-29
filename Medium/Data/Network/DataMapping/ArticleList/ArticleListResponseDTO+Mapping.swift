//
//  ArticleListResponse+Mapping.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import Foundation

struct ArticleResponseDTO: Codable {
    let channel: Channel
}

extension ArticleResponseDTO {
    struct Channel: Codable {
        let title: String
        let description: String
        let image: Image
        let item: [ArticleItem]
        
        struct Image: Codable {
            let url: String
        }
        
        struct ArticleItem: Codable {
            private enum CodingKeys: String, CodingKey {
                case title
                case link
                case content = "content:encoded"
                case creator = "dc:creator"
                case publishDate = "atom:updated"
            }
            
            let title: String
            let link: String
            let creator: String
            let content: String
            let publishDate: String
        }
    }
}

// MARK: - Mappings to Model
extension ArticleResponseDTO {
    func toModel() -> ArticleList {
        return ArticleList(title: channel.title,
                           items: channel.item.map { $0.toModel(creatorIcon: channel.image.url) })
    }
}

extension ArticleResponseDTO.Channel.ArticleItem {
    func toModel(creatorIcon: String) -> ArticleItem {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        return ArticleItem(title: title,
                           link: link,
                           creator: creator,
                           creatorIcon: creatorIcon,
                           content: content,
                           publishDate: dateFormatter.date(from: publishDate))
    }
}
