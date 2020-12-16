/* A class should be open for extension but closed for modification */
import Foundation

// MARK:- Protocols for abstract declaration of an Air Condition functionalities
protocol SwitchOption {
    func turnOn()
    func turnOff()
}

protocol ModeOption {
    func changeMode()
}

protocol FanSpeedOption {
    func setFanSpeed(speed: Int)
}


// MARK:- Classes providing definition to AC functionalities
class Switch: SwitchOption {
    func turnOn() {
        print("Turned ON")
    }
    
    func turnOff() {
        print("Turned OFF")
    }
}

class Mode: ModeOption {
    func changeMode() {
        print("Mode has been Changed")
    }
}

class FanSpeed: FanSpeedOption {
    func setFanSpeed(speed: Int) {
        print("Fan Speed is \(speed)")
    }
}


// MARK:- Class Implementation for Air Conditioning
class AirCondition: SwitchOption, ModeOption, FanSpeedOption {
    
    let mode = Mode()
    let `switch` = Switch()
    let fanSpeed = FanSpeed()
    
    func turnOn() {
        `switch`.turnOn()
    }
    
    func turnOff() {
        `switch`.turnOff()
    }
    
    func changeMode() {
        mode.changeMode()
    }
    
    func setFanSpeed(speed: Int) {
        fanSpeed.setFanSpeed(speed: 5)
    }
}

// MARK:- New feature Humidity to be added to AirCondition class
protocol HumidityOption {
    func setHumidityLevel(level: Int)
}

class Humidity: HumidityOption {
    func setHumidityLevel(level: Int) {
        print("Humidity set to \(level)")
    }
}

// MARK:- New feature implementation by extending AirCondition class
extension AirCondition: HumidityOption {
    func setHumidityLevel(level: Int) {
        let humidity = Humidity()
        humidity.setHumidityLevel(level: level)
    }
}

// MARK:- Driver Program
let acNew = AirCondition()
acNew.turnOn()
acNew.setFanSpeed(speed: 5)
acNew.changeMode()
acNew.setHumidityLevel(level: 10)
acNew.turnOff()
