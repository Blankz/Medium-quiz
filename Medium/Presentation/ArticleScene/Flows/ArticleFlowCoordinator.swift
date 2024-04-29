//
//  ArticleFlowCoordinator.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import UIKit

protocol ArticleFlowCoordinatorProtocol  {
    func initArticlesListViewController(actions: ArticleListViewModelActions) -> ArticleListViewController
    func initArticlesDetailViewController(articleItem: ArticleItemViewModel) -> ArticleDetailViewController
}

class ArticleFlowCoordinator: FlowCoordinatorProtocol {
    
    private weak var navigationController: UINavigationController?
    private let articleFlowProtocol: ArticleFlowCoordinatorProtocol
    
    init(navigationController: UINavigationController,
         articleFlowProtocol: ArticleFlowCoordinatorProtocol) {
        self.navigationController = navigationController
        self.articleFlowProtocol = articleFlowProtocol
    }
    
    func start() {
        let actions = ArticleListViewModelActions(showDetailPage: showDetailPage)
        let vc = articleFlowProtocol.initArticlesListViewController(actions: actions)

        navigationController?.pushViewController(vc, animated: false)
    }
    
    private func showDetailPage(articleItem: ArticleItemViewModel) {
        let vc = articleFlowProtocol.initArticlesDetailViewController(articleItem: articleItem
        )
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
