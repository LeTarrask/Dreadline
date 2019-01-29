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

    @IBOutlet weak var dreadline: NSTextField!

    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false
    var theWork: Dreadline = Dreadline(email: "", worktime: 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        if isTimerRunning == false {
            runTimer()
        }
    }

    override var representedObject: Any? {
        didSet {
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

    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }

    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            // add send email functionality
        } else {
            seconds -= 1     //This will decrement(count down)the seconds.
            dreadline.stringValue = "Dreadline: " + timeString(time: TimeInterval(seconds)) //This will update the label.
        }
    }

    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}

