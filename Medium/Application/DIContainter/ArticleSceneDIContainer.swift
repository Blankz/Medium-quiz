//
//  ArticleSceneDIContainer.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import UIKit

class ArticleSceneDIContainer: ArticleFlowCoordinatorProtocol {
    func initArticlesListViewController() -> ArticleListViewController {
        ArticleListViewController.create()
    }
    
    func initArticleFlowCoordinator(navigationController: UINavigationController) -> ArticleFlowCoordinator {
        ArticleFlowCoordinator(navigationController: navigationController,
                               articleFlowProtocol: self)
    }
}
