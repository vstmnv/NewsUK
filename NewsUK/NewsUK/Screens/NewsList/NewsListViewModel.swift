//
//  NewsListViewModel.swift
//  NewsUK
//
//  Created by Vesela Stamenova on 14.04.23.
//

import Foundation

final class NewsListViewModel: ObservableObject {

	@Published private(set) var articles: [NewsArticle] = []

	func fetchArticles() {
		let newsService = NewsService()
		newsService.getTopHeadlines { [weak self] result in
			switch result {
			case .success(let response):
				self?.articles = response.articles
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}

	func cellViewModel(indexPath: IndexPath) -> NewsListCellViewModel {
		return NewsListCellViewModel(article: articles[indexPath.row])
	}
}
