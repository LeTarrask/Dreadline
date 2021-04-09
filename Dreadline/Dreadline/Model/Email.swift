//
//  Email.swift
//  Dreadline
//
//  Created by tarrask on 29/01/2019.
//  Copyright © 2019 Garagem Infinita. All rights reserved.
//

import Cocoa
import Foundation

class SendEmail: NSObject {
    static func send(boss: String, message: String) {
        let service = NSSharingService(named: NSSharingService.Name.composeEmail)!
        service.recipients = [boss]
        service.subject = "Dreadline"

        service.perform(withItems: [message])
    }
}
