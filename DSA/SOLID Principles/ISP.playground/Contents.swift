/* Clients should not be forced to depend upon Interface that they dont use*/

import Foundation

protocol ButtonGesture {
    func didTap()
    func didDoubleTap()
    func didLongPress()
}

// MARK:- A SuperButton class confirms all protocol methods
class SuperButton: ButtonGesture {
    func didTap() {
        print("Button Tapped")
    }
    
    func didDoubleTap() {
        print("Button Double Tapped")
    }
    
    func didLongPress() {
        print("Button Long Pressed")
    }
}

// MARK:- This class does not require all the protocols but still it has to implement them
class PoorButton: ButtonGesture {
    func didTap() {
        print("Button Tapped")
    }
    
    func didDoubleTap() {}
    
    func didLongPress() {}
}

// MARK:- ISP Way

protocol TapGesture {
    func didTap()
}

protocol DoubleTapGesture {
    func didDoubleTap()
}

protocol LongPressGesture {
    func didLongPress()
}

class MainButton: TapGesture, DoubleTapGesture, LongPressGesture {
    
    func didTap() {
        print("Button Tapped")
    }
    
    func didDoubleTap() {
        print("Button Double Tapped")
    }
    
    func didLongPress() {
        print("Button Long Pressed")
    }
}

class SecondaryButton: TapGesture {
    func didTap() {
        print("Button Tapped")
    }
}

