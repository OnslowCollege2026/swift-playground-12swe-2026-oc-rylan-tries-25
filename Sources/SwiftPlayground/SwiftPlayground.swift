// The Swift Programming Language
// https://docs.swift.org/swift-book

// Create a simple array

// Print each item

// Create 2d array holding ints

// Print each row + item

// Use guard let

func arrayPrinter(row: [Int]) {
for value in row {
    print(value)
}
}

let message = ("Invalid")
func arrayItemPrinter(grid: [[Int]], rowPosition: Int, columnPosition: Int, message: String) {
    guard rowPosition >= 0 && rowPosition < grid.count else { print(message)
    return }
    print(grid[rowPosition][columnPosition])
}


@main
struct SwiftPlayground {
    static func main() {
// var studentsInQuad: [Int]

// How many students were in the quad at 8:00am, 10:30am, 1:00pm
// studentsInQuad = [4, 7, 14]

// Use a 2d array with five rows: one for each day of week
// How many students were in the quad at 8:00am, 10:30am, 1:00pm
var studentsInQuadByDay: [[Int]] 
studentsInQuadByDay = [
    [4, 7, 14], // Mon
    [2, 9, 3], // Tues
    [7, 10, 2], //Wed
    [0, 4, 6], // Thu
    [21, 55, 74] // Fri
]


// Simple example 1d array
// arrayPrinter(row: studentsInQuad)

// Prints out the values on Wed
    // arrayPrinter(row: studentsInQuadByDay[2])

// Prints out Thu 1:00pm
// print(studentsInQuadByDay[3][2])

arrayItemPrinter(grid: studentsInQuadByDay, rowPosition: 1, columnPosition: 0, message: message)
    }
}