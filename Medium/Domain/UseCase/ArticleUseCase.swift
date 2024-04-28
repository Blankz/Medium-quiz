//
//  ArticleUseCase.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import Foundation

protocol ArticleUseCaseProtocol {
    func execute(
        //        requestValue: SearchMoviesUseCaseRequestValue,
        //        cached: @escaping (MoviesPage) -> Void,
        //        completion: @escaping (Result<MoviesPage, Error>) -> Void
    ) -> Cancellable?
}

final class ArticleUseCase: ArticleUseCaseProtocol {
    
    private let articleRepository: ArticleRepository
    //    private let moviesQueriesRepository: MoviesQueriesRepository
    
    init(
        articleRepository: ArticleRepository
        //        moviesQueriesRepository: MoviesQueriesRepository
    ) {
        self.articleRepository = articleRepository
//        self.moviesQueriesRepository = moviesQueriesRepository
    }
    
    func execute(
//        requestValue: SearchMoviesUseCaseRequestValue,
//        cached: @escaping (MoviesPage) -> Void,
//        completion: @escaping (Result<MoviesPage, Error>) -> Void
    ) -> Cancellable? {
        
        return articleRepository.fetchArticleList()
//            query: requestValue.query,
//            page: requestValue.page,
//            cached: cached,
//            completion: { result in
//                
//                if case .success = result {
//                    self.moviesQueriesRepository.saveRecentQuery(query: requestValue.query) { _ in }
//                }
//                
//                completion(result)
//            })
    }
}

//struct SearchMoviesUseCaseRequestValue {
//    let query: MovieQuery
//    let page: Int
//}
