//
//  ArticleSceneDIContainer.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import UIKit

class ArticleSceneDIContainer: ArticleFlowCoordinatorProtocol {
    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Use Cases
    func initArticleUseCase() -> ArticleUseCase {
        ArticleUseCase(articleRepository: initArticleRepository())
    }
    
    // MARK: - Repositories
    func initArticleRepository() -> ArticleRepository {
        ArticleRepository(
            dataTransferService: dependencies.apiDataTransferService
//            cache: moviesResponseCache
        )
    }
    
    // MARK: - Article List
    func initArticlesListViewController() -> ArticleListViewController {
        ArticleListViewController.create(viewModel: initArticleListViewModel())
    }
    
    func initArticleListViewModel() -> ArticleListViewModel {
        ArticleListViewModel(
            articleUseCase: initArticleUseCase()
//            actions: actions
        )
    }
    
    func initArticleFlowCoordinator(navigationController: UINavigationController) -> ArticleFlowCoordinator {
        ArticleFlowCoordinator(navigationController: navigationController,
                               articleFlowProtocol: self)
    }
}
