//
//  ConfigureSheet.swift
//  KrogerAscii
//
//  Created by Robert Burns on 2/2/17.
//  Copyright © 2017 Robert Burns. All rights reserved.
//

import ScreenSaver

class ConfigureSheet: NSObject {

    static var sharedInstance = ConfigureSheet()

    @IBOutlet var window: NSWindow!

    override init()
    {
        super.init()

        let myBundle = Bundle(for: ConfigureSheet.self)
        myBundle.loadNibNamed("ConfigureSheet", owner: self, topLevelObjects: nil)
    }

    @IBAction func closeConfigureSheet(_ sender: NSButton)
    {
        window.sheetParent!.endSheet(window, returnCode: (sender.tag == 1) ? NSModalResponseOK : NSModalResponseCancel)
    }

}
