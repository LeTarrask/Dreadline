//
//  Double+TimeConverter.swift
//  Dreadline
//
//  Created by Alex Luna on 09/04/2021.
//  Copyright © 2021 Garagem Infinita. All rights reserved.
//

import Foundation

extension Double {
    var seconds: Double { return self }

    var minutes: Double { return self.seconds * 60 }

    var hours: Double { return self.minutes * 60 }

    var days: Double { return self.hours * 24 }

    var weeks: Double { return self.days * 7 }

    var months: Double { return self.weeks * 4 }

    var years: Double { return self.months * 12 }
}
