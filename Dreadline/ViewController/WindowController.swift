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
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        shouldCascadeWindows = true
    }

}
