//
//  Dreadline.swift
//  Dreadline
//
//  Created by tarrask on 28/01/2019.
//  Copyright © 2019 Garagem Infinita. All rights reserved.
//

import Foundation

struct Dreadline {
    let workTime: Double?
    let bossEmail: String?
    let startTime: Date?
    let endTime: Date?

    init(email: String, worktime: Double) {//we make sure there's always a worktime
        self.bossEmail = email
        self.workTime = worktime
        self.startTime = Date()
        self.endTime = startTime?.addingTimeInterval(TimeInterval(workTime!.hours))
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
