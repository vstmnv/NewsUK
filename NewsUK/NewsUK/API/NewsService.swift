//
//  NewsService.swift
//  NewsUK
//
//  Created by Vesela Stamenova on 14.04.23.
//

import Foundation

final class NewsService {

	func getTopHeadlines(completion: @escaping (Result<NewsResponse, Error>) -> Void) {
		let apiManager = APIManager()
		let apiRequest = APIRequest<NewsResponse>(path: "top-headlines", queryItems: [URLQueryItem(name: "country", value: "gb")])

		apiManager.run(request: apiRequest, completion: completion)
	}
}
