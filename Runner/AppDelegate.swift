//
//  AppDelegate.swift
//  Runner
//
//  Created by Robert Burns on 2/2/17.
//  Copyright © 2017 Robert Burns. All rights reserved.
//

import Cocoa
import ScreenSaver

@NSApplicationMain
class AppDelegate: NSObject {

    @IBOutlet weak var window: NSWindow!

    var view: ScreenSaverView!

    @IBAction func showPreferences(_ sender: NSObject!)
    {
        window.beginSheet(view.configureSheet()!, completionHandler: nil)
    }

    func setupAndStartAnimation()
    {
        let saverName = UserDefaults.standard.string(forKey: "saver") ?? "Swift Template"
        guard let saverBundle = loadSaverBundle(saverName) else {
            NSLog("Can't find or load bundle for saver named \(saverName).")
            return
        }
        let saverClass = saverBundle.principalClass! as! ScreenSaverView.Type

        view = saverClass.init(frame: window.contentView!.frame, isPreview: false)
        view.autoresizingMask = [NSAutoresizingMaskOptions.viewWidthSizable, NSAutoresizingMaskOptions.viewHeightSizable]

        window.backingType = saverClass.backingStoreType()
        window.title = view.className
        window.contentView!.autoresizesSubviews = true
        window.contentView!.addSubview(view)

        view.startAnimation()
    }

    private func loadSaverBundle(_ name: String) -> Bundle?
    {
        let myBundle = Bundle(for: AppDelegate.self)
        let saverBundleURL = myBundle.bundleURL.deletingLastPathComponent().appendingPathComponent("\(name).saver", isDirectory: true)
        let saverBundle = Bundle(url: saverBundleURL)
        saverBundle?.load()
        return saverBundle
    }

    func restartAnimation()
    {
        stopAnimation()
        view.startAnimation()
    }

    func stopAnimation()
    {
        if view.isAnimating {
            view.stopAnimation()
        }
    }

}


extension AppDelegate: NSApplicationDelegate
{
    func applicationDidFinishLaunching(_ notification: Notification)
    {
        setupAndStartAnimation()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        stopAnimation()
    }
}


extension AppDelegate: NSWindowDelegate
{
    func windowWillClose(_ notification: Notification)
    {
        NSApplication.shared().terminate(window)
    }

    func windowDidResize(_ notification: Notification)
    {
    }

    func windowDidEndSheet(_ notification: Notification)
    {
        restartAnimation()
    }
}
