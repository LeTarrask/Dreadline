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
    @IBOutlet weak var dreadlineLabel: NSTextField!

    var message = ""
    var seconds = 15.0
    var timer: Timer?
    var bossEmail: String?

    @IBOutlet weak var popUp: NSView!

    @IBOutlet weak var emailField: NSTextField!

    @IBOutlet weak var timeField: NSDatePicker!

    @IBAction func startDreadline(_ sender: Any) {
        if emailField.stringValue.isValidEmail() {
            bossEmail = emailField.stringValue

            seconds = timeField.dateValue.timeIntervalSinceNow
            createTimer(deadline: seconds)

            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.sendEmail()
            }

            popUp.isHidden = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let now = Date()
        timeField.minDate = now.addingTimeInterval(60)
    }

    // MARK: Message Content Update
    func sendEmail() {
        _ = SendEmail.send(boss: self.bossEmail ?? "", message: self.message)
    }

    func getMessage() {
        let textView: NSTextView = text.documentView! as! NSTextView
        message = textView.string
    }

    // MARK: String Formatter for Dreadline Label
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }

    // MARK: Word Count Window Function
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

extension TextViewController {
    func createTimer(deadline: Double) {
        // 1
        timer = Timer.scheduledTimer(timeInterval: 1.0,
        target: self,
        selector: #selector(updateLabel),
        userInfo: nil,
        repeats: true)
    }

    @objc func updateLabel() {
        dreadlineLabel.stringValue = "Dreadline: " + timeString(time: seconds)
        seconds -= 1

        if seconds < 1  {
            timer?.invalidate()
            dreadlineLabel.stringValue = "Dreadline is over"
            text.isHidden = true
        } else if seconds < 10 {
            getMessage()
            dreadlineLabel.textColor = .red
        }
    }
}


extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}

extension Double {
    var seconds: Double { return self }

    var minutes: Double { return self.seconds * 60 }

    var hours: Double { return self.minutes * 60 }

    var days: Double { return self.hours * 24 }

    var weeks: Double { return self.days * 7 }

    var months: Double { return self.weeks * 4 }

    var years: Double { return self.months * 12 }
}
