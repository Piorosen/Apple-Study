//
//  AppDelegate.swift
//  PC-Room
//
//  Created by Aoikazto on 2020/02/15.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    public static var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Create the window and set the content view. 
        AppDelegate.window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.resizable, .fullSizeContentView, .miniaturizable, .closable, .titled],
            backing: .buffered, defer: false)
        AppDelegate.window.center()
        AppDelegate.window.title = "챠챠의 도넛 | \"Just enjoy your competition\""
        AppDelegate.window.setFrameAutosaveName("Main Window")
        AppDelegate.window.contentView = NSHostingView(rootView: contentView)
        AppDelegate.window.makeKeyAndOrderFront(nil)
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

