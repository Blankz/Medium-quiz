//
//  ArticleListViewModel.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import Foundation

struct ArticleListViewModelActions {
    let showDetailPage: (ArticleItemViewModel) -> Void
}

protocol ArticleListViewModelInputProtocol {
    func viewDidLoad()
    func numberOfRowsInSection(section: Int) -> Int
    func cellForRowAt(indexPath: IndexPath) -> ArticleItemViewModel
    func didSelectItem(at index: Int)
}

protocol ArticleListViewModelOutputProtocol {
    var loading: Observable<Bool> { get }
    var isReloadView: Observable<Bool?> { get }
}

final class ArticleListViewModel: ArticleListViewModelInputProtocol & ArticleListViewModelOutputProtocol {
    
    private let articleUseCase: ArticleUseCase
    private let actions: ArticleListViewModelActions?
    private let mainQueue: DispatchQueueType
    
    // MARK: - OUTPUT
    
    var items: [ArticleItemViewModel] = []
    let loading: Observable<Bool> = Observable(false)
    var isReloadView: Observable<Bool?> = Observable(.none)
    
    // MARK: - Init
    
    init(
        articleUseCase: ArticleUseCase,
        actions: ArticleListViewModelActions? = nil,
        mainQueue: DispatchQueueType = DispatchQueue.main
    ) {
        self.articleUseCase = articleUseCase
        self.actions = actions
        self.mainQueue = mainQueue
    }
    
    // MARK: - Private
    private func fetchArticleList() {
        self.loading.value = true
        
        articleUseCase.fetchArticleList(
            cached: { [weak self] article in
                self?.mainQueue.async {
                    self?.fetchArticleListSuccess(article)
                    self?.loading.value = false
                }
            },
            completion: { [weak self] result in
                self?.mainQueue.async {
                    switch result {
                    case .success(let article):
                        self?.fetchArticleListSuccess(article)
                    case .failure(let error):
                        self?.handle(error: error)
                    }
                    self?.loading.value = false
                }
            }
        )
    }
    
    private func fetchArticleListSuccess(_ articleList: ArticleList) {
        items = articleList.items.map { ArticleItemViewModel($0) }
        isReloadView.value = true
    }
    
    private func handle(error: Error) {
        // TODO: - Implement Later
    }
}

// MARK: - INPUT. View event methods

extension ArticleListViewModel {
    func viewDidLoad() {
        fetchArticleList()
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        items.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> ArticleItemViewModel {
        return items[indexPath.row]
    }
    
    func didSelectItem(at index: Int) {
        actions?.showDetailPage(items[index])
    }
}
