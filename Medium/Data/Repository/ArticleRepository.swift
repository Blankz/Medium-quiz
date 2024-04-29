//
//  ArticleRepository.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import Foundation

final class ArticleRepository: ArticleRepositoryProtocol {
    private let dataTransferService: DataTransferService
    private let cache: CacheDataProtocol
    private let backgroundQueue: DataTransferDispatchQueue
    
    init(
        dataTransferService: DataTransferService,
        cache: CacheDataProtocol,
        backgroundQueue: DataTransferDispatchQueue = DispatchQueue.global(qos: .userInitiated)
    ) {
        self.dataTransferService = dataTransferService
        self.cache = cache
        self.backgroundQueue = backgroundQueue
    }
    
    func fetchArticleList(
        cached: @escaping (ArticleList) -> Void,
        completion: @escaping (Result<ArticleList, Error>) -> Void
    ) -> Cancellable? {
        let task = RepositoryTask()
        let data = self.cache.loadObjectFromUserDefaults(ArticleResponseDTO.self, forKey: "articleList")
        if let responseDTO = data {
            cached(responseDTO.toModel())
        }
      
        let endpoint = APIEndpoints.article.getArticleList.endpoint()
        task.networkTask = self.dataTransferService.request(
            with: endpoint,
            on: backgroundQueue
        ) { result in
            switch result {
            case .success(let responseDTO):
                self.cache.saveObjectToUserDefaults(responseDTO, forKey: "articleList")
                completion(.success(responseDTO.toModel()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        return task
    }
}
