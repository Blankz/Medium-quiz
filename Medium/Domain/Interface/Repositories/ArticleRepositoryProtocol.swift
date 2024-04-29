//
//  ArticleRepository.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import Foundation

protocol ArticleRepositoryProtocol {
    @discardableResult
    func fetchArticleList(
        cached: @escaping (ArticleList) -> Void,
        completion: @escaping (Result<ArticleList, Error>) -> Void
    ) -> Cancellable?
}
