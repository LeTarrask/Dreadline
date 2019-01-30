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

    @IBOutlet weak var hours: NSPopUpButton!
    @IBOutlet weak var mins: NSPopUpButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startDocument(_ sender: Any) {
    }

    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "startSegue", email.stringValue.isValidEmail() && hours.intValue > 0 {
            if let view = segue.destinationController as? TextViewController {
                view.theWork = Dreadline(email: email.stringValue, worktime: Double(time.stringValue) ?? 00)
                
            }
            // should dismiss this window
        } // should add messages to fix email and or time of work
    }

    override func shouldPerformSegue(withIdentifier identifier: NSStoryboardSegue.Identifier, sender: Any?) -> Bool {
        if email.stringValue.isValidEmail() && Int(time.stringValue) ?? 0 > 0 {
            return true
        }
        return false
    }
}




extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
