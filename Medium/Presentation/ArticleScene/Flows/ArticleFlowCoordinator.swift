//
//  ArticleFlowCoordinator.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import UIKit

protocol ArticleFlowCoordinatorProtocol  {
    func initArticlesListViewController() -> ArticleListViewController
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
        let vc = articleFlowProtocol.initArticlesListViewController()

        navigationController?.pushViewController(vc, animated: false)
    }
}
