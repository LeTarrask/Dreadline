//
//  ViewController.swift
//  Dreadline
//
//  Created by tarrask on 28/01/2019.
//  Copyright © 2019 Garagem Infinita. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var text: NSScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func showWordCountWindow(_ sender: AnyObject) {
        // 1
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let wordCountWindowController = storyboard.instantiateController(withIdentifier: "Word Count Window Controller") as! NSWindowController

        if let wordCountWindow = wordCountWindowController.window {
            if let newText = text.documentView as? NSTextView {

                let textStorage = newText.textStorage

                // 2
                let wordCountViewController = wordCountWindow.contentViewController as! WordCountVC
                wordCountViewController.wordCount = textStorage?.words.count ?? 00
                wordCountViewController.paragraphCount = textStorage?.paragraphs.count ?? 00

                // 3
                let application = NSApplication.shared
                application.runModal(for: wordCountWindow)
                // 4
                wordCountWindow.close()
            }
        }
    }
}

