/* Objects in a program should be able to be replacable with instances of thier sub types without changing correctness of thet program */
import Foundation

// MARK:- Polygon protocol
protocol Polygon {
    var area: Float { get }
    var perimeter: Float { get }
}

class Rectangle: Polygon {
    
    private let height: Float
    private let width: Float
    
    init(height: Float, width: Float) {
        self.height = height
        self.width = width
    }
    
    var area: Float {
        return height * width
    }
    
    var perimeter: Float {
        return 2 * (height + width)
    }
}

class Square: Polygon {
    
    private let side: Float
    
    init(side: Float) {
        self.side = side
    }
    
    var area: Float {
        return side * side
    }
    
    var perimeter: Float {
        return 4 * side
    }
}

class Triangle: Polygon {
    private let base: Float
    private let height: Float
    
    init(base: Float, height: Float) {
        self.base = base
        self.height = height
    }
    
    var area: Float {
        return 0.5 * base * height
    }
    
    var perimeter: Float {
        return 0.0
    }
}

// MARK:- Client Method
func printArea(of shape: Polygon) {
    print("Area:: \(shape.area)")
}

func printPerimeter(of shape: Polygon) {
    print("Perimeter:: \(shape.perimeter)")
}

let rectangle = Rectangle(height: 25, width: 20)
printArea(of: rectangle)
printPerimeter(of: rectangle)

let square = Square(side: 25)
printArea(of: square)
printPerimeter(of: square)

let triangle = Triangle(base: 15, height: 20)
printArea(of: triangle)
printPerimeter(of: triangle)
