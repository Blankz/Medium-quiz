//
//  ArticleListViewController.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import UIKit

class ArticleListViewController: UIViewController, StoryboardInstantiable {
    private var viewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    static func create(viewModel: ArticleListViewModel) -> ArticleListViewController {
        let vc = ArticleListViewController.instantiateViewController()
        vc.viewModel = viewModel
        
        return vc
    }
}
