//
//  ArticleListResponse+Mapping.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import Foundation

struct ArticleResponseDTO: Decodable {
    let channel: Channel
}

extension ArticleResponseDTO {
    struct Channel: Decodable {
        let title: String
        let description: String
        let item: [ArticleItem]
        
        struct ArticleItem: Decodable {
            let title: String
            let link: String
        }
    }
}

// MARK: - Mappings to Model
extension ArticleResponseDTO {
    func toModel() -> ArticleList {
        return ArticleList(title: channel.title,
                           items: channel.item.map { $0.toModel() })
    }
}

extension ArticleResponseDTO.Channel.ArticleItem {
    func toModel() -> ArticleItem {
        return ArticleItem(title: title, link: link)
    }
}

