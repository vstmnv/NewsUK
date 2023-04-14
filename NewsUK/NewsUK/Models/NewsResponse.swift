//
//  NewsResponse.swift
//  NewsUK
//
//  Created by Vesela Stamenova on 14.04.23.
//

import Foundation

struct NewsResponse: Decodable {
	let status: String
	let totalResults: Int
	let articles: [NewsArticle]
}
