//
//  WebView.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 02/09/23.
//

import SwiftUI
import WebKit


struct WebViewRepresentable: UIViewRepresentable {
    
    var url: URL
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
