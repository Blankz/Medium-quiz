//
//  AppFlowCoordinator.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import UIKit

protocol FlowCoordinatorProtocol {
    func start()
}

final class AppFlowCoordinator: FlowCoordinatorProtocol {

    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(
        navigationController: UINavigationController,
        appDIContainer: AppDIContainer
    ) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func start() {
        let articleSceneDIContainer = appDIContainer.makeArticleSceneDIContainer()
        let flow = articleSceneDIContainer.initArticleFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}
