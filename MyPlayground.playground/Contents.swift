import Cocoa

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


struct Dreadline {
    let workTime: Int?
    let bossEmail: String?
    let startTime: Date?
    let endTime: Date?

    init(email: String, worktime: Int) {
        self.bossEmail = email
        self.workTime = worktime
        self.startTime = Date()
        self.endTime = startTime?.addingTimeInterval(TimeInterval(workTime?.hours ?? 00))
    }
}


let dead = Dreadline(email: "tarras@garrak.com", worktime: 3)
print(dead)

