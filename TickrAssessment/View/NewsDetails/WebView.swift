//
//  WebView.swift
//  TickrAssessment
//
//  Created by Pinakin Purohit on 28/06/2021.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    var text: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(text, baseURL: nil)
    }
}

