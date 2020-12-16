import Foundation

/* */

struct Item<T> {
    
    let value: T?
    let key: Int
}

class HashTable<T>{
    
    var hashArray: [Item<T>?]
    var size: Int = 0
    
    init(capacity: Int) {
        self.size = capacity
        hashArray = [Item<T>?](repeating: nil, count: size)
    }
    
    private func hashCode(key: Int) -> Int {
        return key%size
    }
    
    func insert(key: Int, value: T) {
        
        let item = Item(value: value, key: key)
        var hashIndex = hashCode(key: key)
        
        while hashArray[hashIndex] != nil {
            
            //go to next cell
            hashIndex += 1
            
            //wrap around the table
            hashIndex %= size
        }
        
        hashArray[hashIndex] = item
    }
    
    func search(key: Int) {
        var hashIndex = hashCode(key: key)
        
        while hashArray[hashIndex] != nil {
            
            if hashArray[hashIndex]?.key == key {
                print("Found: ",hashArray[hashIndex])
                return
            }
            hashIndex += 1
            hashIndex %= size
        }
        
        print("Key not found")
    }
    
    func delete(key: Int) {
        var hashIndex = hashCode(key: key)
        
        while hashArray[hashIndex] != nil {
            
            if hashArray[hashIndex]?.key == key {
                print("Deleted: ",hashArray[hashIndex])
                hashArray[hashIndex] = nil
                return
            }
            hashIndex += 1
            hashIndex %= size
        }
        print("Key not found")
    }
}

let h = HashTable<String>(capacity: 10)
h.insert(key: 5, value: "Rishab")
h.insert(key: 1, value: "Monu")
h.insert(key: 2, value: "Tom")
h.insert(key: 42, value: "Mark")

//h.delete(key: 5)
h.search(key: 42)

//print(h.hashArray)


