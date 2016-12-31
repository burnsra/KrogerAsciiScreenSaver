//
//  SwiftScreenSaverView.swift
//  SwiftScreenSaverTemplate
//
//  Created by Robert Burns on 10/1/16.
//  Copyright © 2016 Robert Burns. All rights reserved.
//

import Foundation
import GCDWebServers
import ScreenSaver
import WebKit

class SwiftScreenSaverView: ScreenSaverView {

    let ScreenSaverWebView: WebView = WebView(frame: NSZeroRect)
    let webServer: GCDWebServer = GCDWebServer()
    let webPort: UInt = UInt(arc4random_uniform(10) + 5550);

    fileprivate func initialize() {
        self.configureWebView()
        self.addSubview(self.ScreenSaverWebView)
        self.webServer.addGETHandler(forBasePath: "/", directoryPath: "\(Bundle(for: type(of: self)).resourcePath!)/html", indexFilename: "index.html", cacheAge: 1000, allowRangeRequests: true)
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
        NSLog("Starting screensaver on port \(webPort)")
        self.webServer.start(withPort: webPort, bonjourName: nil)
        self.ScreenSaverWebView.mainFrame.load(URLRequest(url: URL(string: "http://localhost:\(webPort)")!))
    }

    override func stopAnimation() {
        super.stopAnimation()
        self.webServer.stop()
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
