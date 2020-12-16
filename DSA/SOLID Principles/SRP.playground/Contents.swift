/* A class should have only one responsiblity(reason to change) */
import Foundation

struct User {
    let id: Int
    let name: String
}

// MARK:- CLASS DOES NOT ONLY CONSTAIN SINGLE RESPONSIBLITY
class UserLogin {
    
    let user: User? = nil
    let data: Data? = nil
    
    func handleUserData() {
        let data = requestDatafromAPI()
        let user = parseJSONResponse(data: data)
        if saveUserToDB(user: user) {
            // user saved successfully
        } else {
            // user can't be saved
        }
    }
    
    private func requestDatafromAPI() -> Data {
        // get data from the servers
        return Data()
    }
    
    private func parseJSONResponse(data: Data) -> User {
        // parse the data from server to a User Define model
        return user ?? User(id: 1, name: "Test User")
    }
    
    private func saveUserToDB(user: User) -> Bool {
        // save user data to DB
        return true
    }
}

// MARK:- Classes with Single Responsiblity

/// User Login Handler class only handles user login process
class UserLoginHandler {
    
    let apiHandler = APIHandler()
    let parsingHandler = ParsingHandler()
    let dbHandler = DBHandler()
    
    private var user: User!
    
    func loginUser() {
        let data = apiHandler.getUserData()
        user = parsingHandler.parseUserData(data: data)
        dbHandler.saveUser(user: user)
    }
}

/// API Handler class only handles data from server(API)
class APIHandler {
    func getUserData() -> Data {
        return Data()
    }
}

/// Parsing Handler class only handles data parsing for different scenarios
class ParsingHandler {
    func parseUserData(data: Data) -> User {
        return User(id: 2, name: "Test2 User")
    }
}

/// DB Handler class only handles proccess to save data to Data Base
class DBHandler {
    func saveUser(user: User) -> Bool {
        return true
    }
}
