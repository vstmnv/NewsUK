//
//  NewsListCellViewModel.swift
//  NewsUK
//
//  Created by Vesela Stamenova on 14.04.23.
//

import Foundation

final class NewsListCellViewModel {

	private enum Constant {
		static let empty = "-"
	}

	private let article: NewsArticle

	let title: String
	let author: String
	let source: String
	let publishedAt: String

	init(article: NewsArticle) {
		self.article = article

		title = article.title
		author = article.author
		source = article.source.name
		publishedAt = article.publishedAt.formattedDate ?? Constant.empty
	}
}
