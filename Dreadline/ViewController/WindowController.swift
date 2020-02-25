//
//  WindowController.swift
//  Dreadline
//
//  Created by tarrask on 28/01/2019.
//  Copyright © 2019 Garagem Infinita. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()

        loadBG()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        shouldCascadeWindows = true
    }

    func loadBG() {
        let window = NSWindow()
        if let screen = NSScreen.main {
            window.setFrame(screen.visibleFrame, display: true, animate: true)
        }

        let visualEffect = NSVisualEffectView()
        visualEffect.blendingMode = .behindWindow
        visualEffect.state = .active
        visualEffect.material = .dark
        visualEffect.layer?.cornerRadius = 16.0
        window.contentView = visualEffect
    }

}
