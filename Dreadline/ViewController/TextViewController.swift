//
//  ViewController.swift
//  Dreadline
//
//  Created by tarrask on 28/01/2019.
//  Copyright © 2019 Garagem Infinita. All rights reserved.
//

import Cocoa

class TextViewController: NSViewController {

    @IBOutlet weak var text: NSScrollView!

    @IBOutlet weak var dreadline: NSTextField!

    var theWork = Dreadline(email: "", worktime: 0)
    var message = ""

    var seconds = 6
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // print(theWork)
        if theWork.workTime! > 0.0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + theWork.workTime!) {
                // call email
                //SendEmail.send(boss: self.theWork.bossEmail ?? "", message: self.message)
            }
            // start timer is not working
            self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                print(self.seconds)
                self.updateTimer(timer)
            }
        }
    }

    func updateTimer(_ timer : Timer) {
        if seconds < 1 {
            timer.invalidate()
        } else if seconds < 10 {
            self.message = getMessage() //updates the message var to the text in view
        } else {
            seconds -= 1     //This will decrement(count down)the seconds.
            dreadline.stringValue = "Dreadline: " + timeString(time: TimeInterval(seconds)) //This will update the label.
        }
    }

    // THIS IS UNTESTED
    func getMessage() -> String{
        let myTextView = text.documentView! as! NSTextView
        return myTextView.string
    }

    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
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
