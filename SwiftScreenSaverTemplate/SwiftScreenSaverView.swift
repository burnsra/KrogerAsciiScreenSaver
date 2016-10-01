//
//  SwiftScreenSaverView.swift
//  SwiftScreenSaverTemplate
//
//  Created by Robert Burns on 10/1/16.
//  Copyright © 2016 Robert Burns. All rights reserved.
//

import Foundation
import ScreenSaver
import WebKit

class SwiftScreenSaverView: ScreenSaverView {

    let ScreenSaverWebView: WebView = WebView(frame: NSZeroRect)

    fileprivate func initialize() {
        self.configureWebView()
        self.addSubview(self.ScreenSaverWebView)
    }

    deinit {
        self.ScreenSaverWebView.removeFromSuperview()
    }

    fileprivate func configureWebView() {
        self.ScreenSaverWebView.frame = self.bounds
        self.ScreenSaverWebView.setMaintainsBackForwardList(false)
    }

    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        self.initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func startAnimation() {
        super.startAnimation()

        let url = String(format:"file://%@/html/index.html", Bundle(for: type(of: self)).resourcePath!).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)

        self.ScreenSaverWebView.mainFrame.load(URLRequest(url: URL(string: url!)!))
    }

    override func stopAnimation() {
        super.stopAnimation()
    }

    override func draw(_ rect: NSRect) {
        super.draw(rect)
    }

    override func animateOneFrame() {

    }

    override func hasConfigureSheet() -> Bool {
        return false
    }

    override func configureSheet() -> NSWindow? {
        return nil
    }

}
