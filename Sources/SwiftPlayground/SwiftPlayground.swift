
// The Swift Programming Language
// https://docs.swift.org/swift-book

/*
Game overview
Battleships is a guessing game on a grid.

One grid stores your hidden ships,
another grid stores the player's guesses,
and each guess reveals a hit or a miss.
We will use two 2D arrays of String symbols:

"~" for empty water,
"S" for a ship,
"X" for a hit,
"O" for a miss.
*/

/// Parameter:
/// - board: The 2D grid to display.
func printBoard(_ board: [[String]]) {
for row in board {
        print(row.joined(separator: " "))
    }
//     for row in board {
//     for value in row {
//         print(value,separator: " ",terminator: " ")
//     }
//     print()
// }

}

@main
struct SwiftPlayground {
    static func main() {

// Creates the 6 * 6 board
let size = 6
var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)
var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)

// Where the ships are postioned, can be changed later
ocean[1][3] = "S"
ocean[2][3] = "S"
ocean[4][0] = "S"
ocean[5][4] = "S"

// Won't showing this in the actual game
print("\nThis is your battleships board of the ocean showing the ships.")
printBoard(ocean)


    }
}
