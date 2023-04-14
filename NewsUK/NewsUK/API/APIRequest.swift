//
//  APIRequest.swift
//  NewsUK
//
//  Created by Vesela Stamenova on 14.04.23.
//

import Foundation

final class APIRequest<O: Decodable> {
	let path: String
	let queryItems: [URLQueryItem]

	init(path: String, queryItems: [URLQueryItem] = []) {
		self.path = path
		self.queryItems = queryItems
	}
}
