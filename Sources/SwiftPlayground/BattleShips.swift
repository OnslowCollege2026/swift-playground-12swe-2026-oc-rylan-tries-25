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

/// What: A generic function that is used to validate users input is an int
/// Returns: The user's input
func intInputValidator(minSize: Int, maxSize: Int) -> Int {
    while true {
        let userInput = readLine()!
        if let userChoice = Int(userInput), Int(userInput)! >= minSize, Int(userInput)! <= maxSize {
            return userChoice
        } else {
            print("You entered '\(userInput)', please enter a valid input.")
        }
    }
}

/// Parameters:
/// - row: The row index for the guess.
/// - col: The column index for the guess.
/// - ocean: The hidden ships grid.
/// - guesses: The player's current guesses grid.
///
/// Returns: The updated guesses grid after the guess is applied.
func processGuess(row: Int, col: Int, ocean: [[String]], guesses: [[String]], remainingShips: Int) -> [[String]] {
var newGuesses = guesses
if ocean[row][col] == "S"{
    print("Hit!\n")
    newGuesses[row][col] = "X"
    var remainingShips = remainingShips - 1
    
} else {
    print("Miss!\n")
    newGuesses[row][col] = "O"
}

return newGuesses
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

        // Won't show this in the actual game
        print("\nThis is your battleships board of the ocean showing the ships.")
        printBoard(ocean)

        // Will show this in the actual game
        print("\nThis is your battleships board of your guesses.")
        printBoard(guesses)

        /*
        Write a loop that allows the player to make 5 guesses. Done
        
        For each guess:
        
        Ask for row and column input. Done
        Call processGuess.
        Save the updated guesses grid (the function prints the message).
        Print the guesses board.
        */

        var guessesRemaining = 5
        var remainingShips = 4

        // Create a while loop allowing the user to have five guesses
        while guessesRemaining > 0 {
            // var guessesRemaining = 5
            print("You have \(guessesRemaining) guesses remaining.")

            // Ask for row and column input, and validates the input will be in the grid
            print("\nWhich row would you like to guess. Enter 1-\(size)")
            let rowInput = intInputValidator(minSize: 1, maxSize: size)
            print(rowInput)

            print("\nWhich column would you like to guess. Enter 1-\(size)")
            let columnInput = intInputValidator(minSize: 1, maxSize: size)
            print(columnInput)

            
            guessesRemaining = guessesRemaining - 1

            // If user input equals the column and row of the ships then replace "~" with "X" and if not then "O"
            // Changes the users input to be in array based format e.g 1 becomes 0
            guesses = processGuess(row: Int, col: Int, ocean: [[String]], guesses: [[String]], remainingShips: remainingShips)
            
            printBoard(guesses) 
            print(remainingShips)
        }
    }
}
