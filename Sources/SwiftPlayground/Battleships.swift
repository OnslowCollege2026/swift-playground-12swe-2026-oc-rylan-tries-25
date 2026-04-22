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


/// What: Prints the 2d array (The board) with the items being seperated by a space  
/// Parameters:
/// - board: The 2d array to print.
/// Returns: Nothing.
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

/// What: A generic function that is used to validate users input is an int within a certain range
/// Parameters:
/// - minSize: The minimum size the int can be
/// - maxSize: The maximum size the int can be
/// Returns: The user's input if valid
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
/// What: Processes the users guess checks if it's a hit or miss, and then returns an updated board 
/// Parameters:
/// - row: The row index for the guess.
/// - col: The column index for the guess.
/// - ocean: The hidden ships grid.
/// - guesses: The player's current guesses grid.
/// 
/// Returns: A new 'guesses board' after the guess is checked and applied.
func processGuess(row: Int, col: Int, ocean: [[String]], guesses: [[String]])
    -> [[String]]
{
    var newGuesses = guesses

    if guesses[row][col] == "O" || guesses[row][col] == "X" {
        print("You've already guessed there, please guess somewhere else.\n")

    } else if

    ocean[row][col] == "S" {
        print("Hit!\n")
        newGuesses[row][col] = "X"
        // var remainingShips = remainingShips - 1

    } else {
        print("Miss!\n")
        newGuesses[row][col] = "O"
    }
    return newGuesses
}
/// What: Checks how many ships are remaining in the ocean by counting the ships and subtracting the hits 
/// Parameters:
/// - ocean: The hidden ships grid.
/// - guesses: The player's current guesses grid.
///
/// Returns: How many ships remain unhit.
func remainingShips(ocean: [[String]], guesses: [[String]]) -> Int {
    var shipCount = 0
    for row in ocean {
        for value in row {
            if value == "S" {
                shipCount += 1

            }
        }
    }
    var HitShipCount = 0
    for row in guesses {
        for value in row {
            if value == "X" {
                HitShipCount += 1
            }
        }
    }
    return shipCount - HitShipCount
}

/// What: Randomly places the ships in the ocean array
/// Parameters:
/// - ocean: The hidden ships grid.
/// - shipAmount: How many ships there are.
///
/// Returns: The ocean array with the ships in it.

// for ship in 0..<shipAmount {
// oceanWithShips[possibleCoordinates[0][0]][possibleCoordinates[0][1]] = "S"
// }

func putShipsInOcean(ocean: [[String]], shipAmount: Int) -> [[String]] {

    var oceanWithShips = ocean

    // Making an array array of all possible coordinates
    // Looks like this [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [1, 0], [1, 1], [1, 2], [1, 3]...] 
    var possibleCoordinates: [[Int]] = []
    for row in 0..<ocean.count {
        for col in 0..<ocean[row].count {
            possibleCoordinates.append([row, col])
        }
    }
    
    // Shuffling the array of all the possible coordinates to randomise them
    possibleCoordinates.shuffle()
    // Possible coordinates should now look something like [[3, 0], [0, 1], [3, 2], [2, 2], [4, 0]...]

    // For each ship pick the corresponding set of coordinates from the randomised possible coordinates array
    // You can't get same location twice because each set of coordinates is only in the array once so it can only be picked once (like a deck of cards)
    for ship in 0..<min(shipAmount, possibleCoordinates.count) {
        let row = possibleCoordinates[ship][0]
        let col = possibleCoordinates[ship][1]
        oceanWithShips[row][col] = "S"
    }
    return oceanWithShips
}

@main
struct SwiftPlayground {
    static func main() {

        // Creates the board to the dimensions the user wants
        print ("\nWhat size do you want the board to be horizontially? (Between 2 - 12)")
        let sizeX = intInputValidator(minSize: 2, maxSize: 12)

        print ("\nWhat size do you want the board to be vertically? (Between 2 - 12)")
        let sizeY = intInputValidator(minSize: 2, maxSize: 12)

        // Setting the ocean and guesses variables to be their 2d arrays
        var ocean = Array(repeating: Array(repeating: "~", count: sizeX), count: sizeY)
        var guesses = Array(repeating: Array(repeating: "~", count: sizeX), count: sizeY)

        // Sets the amount of ships to the users input after validating their input
        print("\nHow many ships would you like to play with? (Between 2 - 6)")
        let shipAmount = intInputValidator(minSize: 2, maxSize: 6)

        // Sets the amount of guesses to the users input after validating their input
        print("\nHow many guesses would you like to play with? (Between \(shipAmount) - \((shipAmount * 3)))")
        var guessesRemaining = intInputValidator(minSize: shipAmount, maxSize: (shipAmount * 3))


        // Call place ships function and return ocean with ships in it in their randomised positions
        ocean = putShipsInOcean(ocean:ocean, shipAmount:shipAmount)

        // Comment out random ships placement above and use this for manual ship placement
        // ocean[1][3] = "S"
        // ocean[2][3] = "S"
        // ocean[4][0] = "S"
        // ocean[5][4] = "S"

        // Won't show this in the actual game
        // print("\nThis is your battleships board of the ocean showing the ships.")
        // printBoard(ocean)

        // Will show this in the actual game
        print("\nThis is your battleships board of your guesses.")
        printBoard(guesses)
        
        // How many ships are left in the ocean
        var shipsRemaining = remainingShips(ocean: ocean, guesses: guesses)

        // Create a while loop allowing the user to guess the location of the ships until they hit them all or run out of guesses
        while guessesRemaining > 0 && shipsRemaining > 0 {
            print(
                "You have \(shipsRemaining) ships remaining, and \(guessesRemaining) guesses remaining."
            )

            // Asks for row and column input, and validates the input will be in the grid
            print("\nWhich row would you like to guess. Enter 1-\(sizeX)")
            let rowInput = intInputValidator(minSize: 1, maxSize: sizeX)
            // print(rowInput)

            print("\nWhich column would you like to guess. Enter 1-\(sizeY)")
            let columnInput = intInputValidator(minSize: 1, maxSize: sizeY)
            // print(columnInput)

            // If user input equals the column and row of the ships then replace "~" with "X" and if not then "O"
            // Changes the users input into array based format e.g 1 becomes 0 before passing it into processGuess

            // Process guesses returns all the users guesses in a new grid if they are valid
            // If the guess isn't valid then it returns the same grid
            let returnedGuesses = processGuess(
                row: rowInput - 1, col: columnInput - 1, ocean: ocean, guesses: guesses)
            // If the new grid isn't the same as the old grid then adjusts the guesses remaining
            if guesses != returnedGuesses {
                guesses = returnedGuesses
                guessesRemaining = guessesRemaining - 1
            }

            printBoard(guesses)

            // print(remainingShips)

            // Call the remainingShips function
            shipsRemaining = remainingShips(ocean: ocean, guesses: guesses)

        }
        
        if shipsRemaining == 0 {
            print("You have won, congratulations.\n")
        } else {
            print("\nYou have lost")
            print("\nThe ships were here")
            printBoard(ocean)
        }
    }
}
