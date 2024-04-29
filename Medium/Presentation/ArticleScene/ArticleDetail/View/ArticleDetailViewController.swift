//
//  ArticleDetailViewController.swift
//  Medium
//
//  Created by Blank on 29/4/2567 BE.
//

import UIKit
import WebKit

class ArticleDetailViewController: UIViewController, StoryboardInstantiable {
    
    private var viewModel: ArticleDetailViewModel!
    
    @IBOutlet weak var webview: WKWebView!
    static func create(viewModel: ArticleDetailViewModel) -> ArticleDetailViewController {
        let vc = ArticleDetailViewController.instantiateViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel)
    }
    
    
    // MARK: - Private function
    private func bind(to viewModel: ArticleDetailViewModel) {
        viewModel.title.observe(on: self) { [weak self] title in self?.updateTitle(title: title) }
        viewModel.link.observe(on: self) { [weak self] link in self?.updateWebview(link: link)
        }
    }
    
    private func updateTitle(title: String) {
        self.title = title
    }
    
    private func updateWebview(link: URL?) {
        guard let url = link else { return }
        
        webview.load(URLRequest(url: url))
    }
}
