import Cocoa

var seconds = 60
var timer = Timer()

class MyClass {
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        print("startou")
    }

    @objc func updateTimer() {
        seconds -= 1
        print(seconds)
    }
}

let uff = MyClass()
uff.startTimer()
