/* High level modules should not depend on Low level modules instead both should depend on Abstraction */

import Foundation

// MARK:- low level module
class FileSystemManager {
    func save(string: String) {
        //
    }
}

// MARK: High level module depends on Low level module its tightly coupled
class Handler {
    let fm = FileSystemManager()
    
    func handle(string: String) {
        fm.save(string: string)
    }
}

// MARK:- DIP Way
protocol Storage {
    func save(str: String)
}

class FSM: Storage {
    func save(str: String) {
        //
    }
}

class DBM: Storage {
    func save(str: String) {
        //
    }
}

