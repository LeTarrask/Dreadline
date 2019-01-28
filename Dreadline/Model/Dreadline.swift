//
//  Dreadline.swift
//  Dreadline
//
//  Created by tarrask on 28/01/2019.
//  Copyright © 2019 Garagem Infinita. All rights reserved.
//

import Foundation

struct Dreadline {
    let workTime: Int?
    let bossEmail: String?
    let startTime: Date?
    let endTime: Date?

    init(email: String, worktime: Int) {
        self.bossEmail = email
        self.workTime = worktime
        self.startTime = Date()
        self.endTime = startTime?.addingTimeInterval(TimeInterval(Double(workTime ?? 00) * 60.0))
    }
}

extension Int {

    var seconds: Int {
        return self
    }

    var minutes: Int {
        return self.seconds * 60
    }

    var hours: Int {
        return self.minutes * 60
    }

    var days: Int {
        return self.hours * 24
    }

    var weeks: Int {
        return self.days * 7
    }

    var months: Int {
        return self.weeks * 4
    }

    var years: Int {
        return self.months * 12
    }
}
