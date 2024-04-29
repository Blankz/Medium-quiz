//
//  ArticleUseCase.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import Foundation

protocol ArticleUseCaseProtocol {
    func fetchArticleList(
        cached: @escaping (ArticleList) -> Void,
        completion: @escaping (Result<ArticleList, Error>) -> Void
    ) -> Cancellable?
}

final class ArticleUseCase: ArticleUseCaseProtocol {
    
    private let articleRepository: ArticleRepository
    
    init(
        articleRepository: ArticleRepository
    ) {
        self.articleRepository = articleRepository
    }
    
    func fetchArticleList(
        cached: @escaping (ArticleList) -> Void,
        completion: @escaping (Result<ArticleList, Error>) -> Void
    ) -> Cancellable? {
        return articleRepository.fetchArticleList(
            cached: cached,
            completion: { result in
                completion(result)
            })
    }
}
