//
//  ArticleEndpoint.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import Foundation

enum ArticleEndpoints {
    case getArticleList
    
    func endpoint() -> Endpoint<ArticleResponseDTO> {
        switch self {
        case .getArticleList:
            Endpoint(
                path: "feed/@primoapp",
                method: .get
            )
        }
        
    }
}


