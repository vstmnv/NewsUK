//
//  NewsListViewController.swift
//  NewsUK
//
//  Created by Vesela Stamenova on 14.04.23.
//

import UIKit
import Combine

final class NewsListViewController: UIViewController {

	private enum Constant {
		static let newsCell = "newsListCell"
	}

	private let viewModel = NewsListViewModel()
	private var cancellables: [AnyCancellable] = []
	private let refreshControl = UIRefreshControl()

	@IBOutlet private weak var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()

		configureBindings()
		configureTableView()
		viewModel.fetchArticles()
	}

	// MARK: - Private

	private func configureBindings() {
		viewModel.$articles
			.receive(on: DispatchQueue.main)
			.sink { [weak self] articles in
				self?.tableView.reloadData()
				self?.refreshControl.endRefreshing()
			}
			.store(in: &cancellables)
	}

	private func configureTableView() {
		refreshControl.addTarget(self, action: #selector(refreshArticles), for: .valueChanged)
		tableView.refreshControl = refreshControl
	}

	@objc private func refreshArticles() {
		viewModel.fetchArticles()
	}
}

extension NewsListViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		viewModel.articles.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.newsCell, for: indexPath) as? NewsListCell else {
			return UITableViewCell()
		}

		cell.configure(viewModel: viewModel.cellViewModel(indexPath: indexPath))
		return cell
	}
}

extension NewsListViewController: UITableViewDelegate {

}
