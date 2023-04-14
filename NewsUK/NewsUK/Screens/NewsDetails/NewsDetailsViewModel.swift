//
//  NewsDetailsViewModel.swift
//  NewsUK
//
//  Created by Vesela Stamenova on 14.04.23.
//

import Foundation

final class NewsDetailsViewModel {

	private enum Constant {
		static let defaultImage = "article"
	}

	private let article: NewsArticle

	let title: String
	let articleURL: URL?
	let defaultImageName: String
	@Published private(set) var imageData: Data?

	init(article: NewsArticle) {
		self.article = article

		title = article.title
		articleURL = URL(string: article.url)
		defaultImageName = Constant.defaultImage

		fetchArticleImage()
	}

	// MARK: - Private

	private func fetchArticleImage() {
		guard let urlToImage = article.urlToImage,
			  let imageUrl = URL(string: urlToImage) else {
			return
		}

		let newsService = NewsService()
		newsService.getImage(url: imageUrl) { [weak self] data, _ in
			self?.imageData = data
		}
	}
}
