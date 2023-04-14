//
//  APIManager.swift
//  NewsUK
//
//  Created by Vesela Stamenova on 14.04.23.
//

import Foundation

final class APIManager {

	private enum Constant {
		static let authorizationHeader = "Authorization"
	}

	enum HTTPMethod: String {
		case get
		case post
		case put
		case delete

		var value: String {
			return self.rawValue.uppercased()
		}
	}

	private let session = URLSession(configuration: .default)
	private var dataTask: URLSessionDataTask?

	func run<O: Decodable>(
		path: String,
		httpMethod: HTTPMethod = .get,
		queryItems: [URLQueryItem] = [],
		completion: @escaping (Result<O, Error>) -> Void
	) {
		guard let baseURL = API.baseURL,
			  let apiKey = API.apiKey,
			  let url = URL(string: baseURL) else {
			completion(.failure(InternalError()))
			return
		}

		let urlWithPathAndQuery = url.appending(path: path).appending(queryItems: queryItems)
		var request = URLRequest(url: urlWithPathAndQuery)
		request.httpMethod = httpMethod.value
		request.setValue(apiKey, forHTTPHeaderField: Constant.authorizationHeader)

		run(request: request) { data, error in
			if let error {
				completion(.failure(error))
			} else if let data {
				do {
					let decoded = try JSONDecoder().decode(O.self, from: data)
					completion(.success(decoded))
				} catch {
					completion(.failure(error))
				}
			} else {
				completion(.failure(InternalError()))
			}
		}
	}

	func run(request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
		dataTask?.cancel()
		dataTask = session.dataTask(with: request) { data, _, error in
			DispatchQueue.main.async {
				completion(data, error)
			}
		}
		dataTask?.resume()
	}
}

final class InternalError: Error {}
