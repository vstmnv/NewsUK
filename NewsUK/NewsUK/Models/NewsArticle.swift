//
//  NewsArticle.swift
//  NewsUK
//
//  Created by Vesela Stamenova on 14.04.23.
//

import Foundation

struct NewsArticle: Decodable {
	let title: String
	let author: String
	let publishedAt: String
	let source: NewsSource
	let url: String
	let urlToImage: String?
}
