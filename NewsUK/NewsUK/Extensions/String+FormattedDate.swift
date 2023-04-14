//
//  String+FormattedDate.swift
//  NewsUK
//
//  Created by Vesela Stamenova on 14.04.23.
//

import Foundation

extension String {
	var formattedDate: String? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
		let date = dateFormatter.date(from: self)

		return date?.formatted(date: .abbreviated, time: .shortened)
	}
}
