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

    @IBAction func startDocument(_ sender: Any) {
        if email.stringValue.isValidEmail() && Int(time.stringValue) ?? 0 > 0 {
            let theWork = Dreadline(email: email.stringValue, worktime: Int(time.stringValue)!)
            
            
            //            let window = NSApplication.shared.windows[0]
//            let viewcontroller = window.contentViewController as! ViewController
//            viewcontroller.theWork = theWork

            let application = NSApplication.shared
            application.stopModal()
        }
    }

//    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
//        if segue.identifier == "startSegue", (segue.destinationController as AnyObject).identifier == "Document View Controller" {
//            print("sei")
//        }
//    }
}




extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
