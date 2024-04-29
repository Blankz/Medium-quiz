//
//  ArticleListViewController.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import UIKit

class ArticleListViewController: UIViewController, StoryboardInstantiable {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    private var viewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }
    
    static func create(viewModel: ArticleListViewModel) -> ArticleListViewController {
        let vc = ArticleListViewController.instantiateViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    // MARK: - Private function
    private func bind(to viewModel: ArticleListViewModel) {
        viewModel.isReloadView.observe(on: self) { [weak self] _ in self?.updateItems() }
        viewModel.loading.observe(on: self) { [weak self] in self?.updateLoading($0) }
        //        viewModel.query.observe(on: self) { [weak self] in self?.updateSearchQuery($0) }
        //        viewModel.error.observe(on: self) { [weak self] in self?.showError($0) }
    }
    
    private func updateLoading(_ loading: Bool) {
        if loading {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            tableView.isHidden = true
        } else {
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            tableView.isHidden = false
        }
    }
    
    private func setupTableView() {
        
        tableView.register(UINib.init(nibName: "ArticleItemTableViewCell", bundle: nil),
                           forCellReuseIdentifier: ArticleItemTableViewCell.identifiedCell)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func updateItems() {
        tableView.reloadData()
    }
}

// MARK: - TableView Delegate & DataSoucre
extension ArticleListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleItemTableViewCell.identifiedCell,
                                                       for: indexPath) as? ArticleItemTableViewCell else {
            return UITableViewCell()
        }

        cell.viewModel = viewModel.cellForRowAt(indexPath: indexPath)
        
        return cell
    }
}
