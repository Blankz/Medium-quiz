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
//        query: MovieQuery,
//        page: Int,
//        cached: @escaping (MoviesPage) -> Void,
//        completion: @escaping (Result<MoviesPage, Error>) -> Void
    ) -> Cancellable?
}
