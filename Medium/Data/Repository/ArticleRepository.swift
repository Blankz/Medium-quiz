//
//  ArticleRepository.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import Foundation

final class ArticleRepository: ArticleRepositoryProtocol {
    
    private let dataTransferService: DataTransferService
    //    private let cache: MoviesResponseStorage
    private let backgroundQueue: DataTransferDispatchQueue
    
    init(
        dataTransferService: DataTransferService,
        //        cache: MoviesResponseStorage,
        backgroundQueue: DataTransferDispatchQueue = DispatchQueue.global(qos: .userInitiated)
    ) {
        self.dataTransferService = dataTransferService
        //        self.cache = cache
        self.backgroundQueue = backgroundQueue
    }
    
    func fetchArticleList(
        //        query: MovieQuery,
        //        page: Int,
        //        cached: @escaping (MoviesPage) -> Void,
        //        completion: @escaping (Result<MoviesPage, Error>) -> Void
    ) -> Cancellable? {
        
        //        let requestDTO = MoviesRequestDTO(query: query.query, page: page)
        let task = RepositoryTask()
        
        ////        cache.getResponse(for: requestDTO) { [weak self, backgroundQueue] result in
        //
        ////            if case let .success(responseDTO?) = result {
        ////                cached(responseDTO.toDomain())
        ////            }
        ////            guard !task.isCancelled else { return }
        //
        let endpoint = APIEndpoints.article.getArticleList.endpoint()
        task.networkTask = self.dataTransferService.request(
            with: endpoint,
            on: backgroundQueue
        ) { result in
            switch result {
            case .success(let responseDTO):
                print(result)
                break
                //                    self?.cache.save(response: responseDTO, for: requestDTO)
                //                    completion(.success(responseDTO.toDomain()))
            case .failure(let error):
                break
                //                    completion(.failure(error))
            }
        }
        
        return task
    }
}
