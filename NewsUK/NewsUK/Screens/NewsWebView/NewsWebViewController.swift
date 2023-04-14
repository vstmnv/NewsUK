//
//  NewsWebViewController.swift
//  NewsUK
//
//  Created by Vesela Stamenova on 14.04.23.
//

import Foundation
import WebKit

final class NewsWebViewController: UIViewController {

	private var url: URL?

	@IBOutlet private weak var webView: WKWebView!

	override func viewDidLoad() {
		super.viewDidLoad()
		loadWebView()
	}

	// MARK: - Public

	func configure(url: URL) {
		self.url = url
	}

	// MARK: - Private

	private func loadWebView() {
		guard let url else {
			return
		}

		/*
		 There is an error message saying that webView.load() must not be called on the main thread,
		 but also crashes when called from a background thread. This seems to be a known issue on the Apple forums:
		 The poor interaction between WKWebView, Security framework, and this Xcode feature is a known issue (r. 94019453).
		 We plan to address it at some point but I don’t have any info to share as to when that’ll happen.
		 */
		webView.load(URLRequest(url: url))
	}
}
