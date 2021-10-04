//
//  WebView.swift
//  MovieReviewSwiftUI
//
//  Created by Andrew Ant on 02.10.2021.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        return WKWebView(
            frame: .zero,
            configuration: config
        )
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let reviewURL = url else { return }
        let request = URLRequest(url: reviewURL)
        uiView.load(request)
    }
}
