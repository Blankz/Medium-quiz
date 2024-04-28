//
//  AppDIContainer.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import Foundation

final class AppDIContainer {
    lazy var appConfiguration = AppConfiguration()
    
    // MARK: - Network
    lazy var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(
            baseURL: URL(string: appConfiguration.apiBaseURL)!
        )
        
        let apiDataNetwork = DefaultNetworkService(config: config)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()
    
    func makeArticleSceneDIContainer() -> ArticleSceneDIContainer {
        let dependencies = ArticleSceneDIContainer.Dependencies(
            apiDataTransferService: apiDataTransferService
        )
        return ArticleSceneDIContainer(dependencies: dependencies)
    }
}
