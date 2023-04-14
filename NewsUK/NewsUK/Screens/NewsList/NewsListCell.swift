//
//  NewsListCell.swift
//  NewsUK
//
//  Created by Vesela Stamenova on 14.04.23.
//

import UIKit

final class NewsListCell: UITableViewCell {

	@IBOutlet private weak var titleLabel: UILabel!
	@IBOutlet private weak var authorLabel: UILabel!
	@IBOutlet private weak var sourceLabel: UILabel!
	@IBOutlet private weak var publishedLabel: UILabel!

	func configure(viewModel: NewsListCellViewModel) {
		titleLabel.text = viewModel.title
		authorLabel.text = viewModel.author
		sourceLabel.text = viewModel.source
		publishedLabel.text = viewModel.publishedAt
	}
}

