//
//  WebView.swift
//  dialog
//
//  Created by Bart Reardon on 29/9/2022.
//

import SwiftUI
import WebViewKit
import WebKit

struct WebContentView: View {

    @ObservedObject var observedDialogContent: DialogUpdatableContent

    var url: String //(string: observedDialogContent.args.webcontent.value)

    let wvConfiguration = WKWebViewConfiguration()

    init(observedDialogContent: DialogUpdatableContent, url: String) {
        self.observedDialogContent = observedDialogContent
        self.url = url
        wvConfiguration.websiteDataStore = WKWebsiteDataStore.nonPersistent()
    }

    var body: some View {
        if observedDialogContent.args.webcontent.present {
            webView
                .ignoresSafeArea()
        }
    }
}

private extension WebContentView {

    var webView: some View {
        WebView(url: URL(string: url), configuration: wvConfiguration)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .overlay(RoundedRectangle(cornerRadius: 5)
            .stroke(.gray.opacity(0.5), lineWidth: 1))
    }
}
