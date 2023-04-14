//
//  NewsDetailsViewController.swift
//  NewsUK
//
//  Created by Vesela Stamenova on 14.04.23.
//

import UIKit
import Combine

final class NewsDetailsViewController: UIViewController {

	private var viewModel: NewsDetailsViewModel?
	private var cancellables: [AnyCancellable] = []

	@IBOutlet private weak var titleLabel: UILabel!
	@IBOutlet private weak var articleImageView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()

		configureBindings()
		configureDetails()
	}

	// MARK: - Public

	func configure(viewModel: NewsDetailsViewModel) {
		self.viewModel = viewModel
	}

	// MARK: - Private

	private func configureBindings() {
		guard let viewModel else {
			return
		}

		viewModel.$imageData
			.receive(on: DispatchQueue.main)
			.sink { [weak self] imageData in
				if let imageData {
					self?.articleImageView.image = UIImage(data: imageData)
				}
			}
			.store(in: &cancellables)
	}

	private func configureDetails() {
		guard let viewModel = viewModel else {
			return
		}

		titleLabel.text = viewModel.title
		articleImageView.image = UIImage(named: viewModel.defaultImageName)
	}

	// MARK: - IBAction

	@IBAction private func openArticle(_ sender: UIButton) {

	}
}
