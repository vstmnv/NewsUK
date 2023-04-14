//
//  AppConstants.swift
//  NewsUK
//
//  Created by Vesela Stamenova on 14.04.23.
//

import Foundation

enum API {
	static let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String
	static let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
}
