//
//  StartVC.swift
//  Dreadline
//
//  Created by tarrask on 28/01/2019.
//  Copyright © 2019 Garagem Infinita. All rights reserved.
//

import Cocoa

class StartVC: NSViewController {

    @IBOutlet weak var email: NSTextField!
    @IBOutlet weak var time: NSTextField!


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        let theWork = Dreadline(email: email.stringValue, worktime: Int(time.stringValue) ?? 00)
        let windowController = segue.destinationController as! NSWindowController

        if let window = windowController.window {
            let viewController = window.contentViewController as! ViewController
            viewController.theWork = theWork
            print(viewController.theWork)
        }
    }

    override func shouldPerformSegue(withIdentifier identifier: NSStoryboardSegue.Identifier, sender: Any?) -> Bool {
        if email.stringValue.isValidEmail() && Int(time.stringValue) ?? 0 > 0, identifier == "startSegue" {
                return true
        } else {
            return false
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
