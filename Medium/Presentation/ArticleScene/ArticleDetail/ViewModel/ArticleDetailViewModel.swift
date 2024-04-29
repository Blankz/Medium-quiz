//
//  ArticleDetailViewModel.swift
//  Medium
//
//  Created by Blank on 29/4/2567 BE.
//

import Foundation

protocol ArticleDetailViewModelInputProtocol {

}

protocol ArticleDetailViewModelOutputtProtocol {
    var title: Observable<String> { get }
    var link: Observable<URL?> { get }
    
 
}

final class ArticleDetailViewModel: ArticleDetailViewModelInputProtocol & ArticleDetailViewModelOutputtProtocol {
    var title: Observable<String>
    var link: Observable<URL?>

    init(articleItem: ArticleItemViewModel) {
        self.title = Observable(articleItem.title)
        self.link = Observable(URL(string: articleItem.link))
    }
}
