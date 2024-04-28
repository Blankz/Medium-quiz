//
//  ArticleListViewController.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import UIKit

class ArticleListViewController: UIViewController, StoryboardInstantiable {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    static func create() -> ArticleListViewController {
        ArticleListViewController.instantiateViewController()
    }
}
