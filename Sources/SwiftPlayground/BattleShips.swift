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

/// Parameters:
/// - size: The width and height of the square grid.
/// - shipCount: How many ships to place.
///
/// Returns: A new ocean grid with ships placed.
// func randomShipPlacement(size: Int, shipCount: Int) -> [[String]] {
//     // return placements
// }

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

// Randomly places the ships in the ocean array
/// Parameters:
/// - ocean: The hidden ships grid.
/// - shipAmount: How many ships there are.
///
/// Returns: The ocean array with the ships in it.
/// 
// func shipsInOcean(ocean:[[String]], shipAmount:Int) -> [[String]] {

//     var oceanWithShips = ocean

// var possibleCoordinates: [[Int]] = []

// for row in 0..<5 {
//     for col in 0..<5 {
//         possibleCoordinates.append([ row, col])
//     }
// }

// possibleCoordinates.shuffle()

// // Possible coordinates should look like [[3, 0], [0, 1], [3, 2], [2, 2], [4, 0]...

// for ship in 0..<shipAmount {
// oceanWithShips[possibleCoordinates[0][0]][possibleCoordinates[0][1]] = "S"
// }

// // New array
// return oceanWithShips

// }

func shipsInOcean(ocean: [[String]], shipAmount: Int) -> [[String]] {

    var oceanWithShips = ocean
    var possibleCoordinates: [[Int]] = []

    let size = ocean.count

    for row in 0..<size {
        for col in 0..<size {
            possibleCoordinates.append([row, col])
        }
    }

    possibleCoordinates.shuffle()

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

        // Creates the 6 * 6 board
        print ("\nWhat size board do you want? (Between 5 - 12)")
        let size = intInputValidator(minSize: 5, maxSize: 12)

        // let size = 6

        var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)
        var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)

        // Where the ships are postioned, can be changed later
        
        
        print("\nHow many ships would you like to play with? (Between 2 - 6)")
        
        let shipAmount = intInputValidator(minSize: 2, maxSize: 6)

        print("\nHow many guesses would you like to play with? (Between \(shipAmount) - \((shipAmount * 3)))")
        
        var guessesRemaining = intInputValidator(minSize: shipAmount, maxSize: (shipAmount * 3))

        // let shipAmount = 2

        // Call place ships function and return ocean with ships in it
        ocean = shipsInOcean(ocean:ocean, shipAmount:shipAmount)

        // ocean[1][3] = "S"
        // // ocean[2][3] = "S"
        // // ocean[4][0] = "S"
        // // ocean[5][4] = "S"

        // Won't show this in the actual game
        // print("\nThis is your battleships board of the ocean showing the ships.")
        // printBoard(ocean)

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
        
        
        var shipsRemaining = remainingShips(ocean: ocean, guesses: guesses)

        // Create a while loop allowing the user to have five guesses
        while guessesRemaining > 0 && shipsRemaining > 0 {
            // var guessesRemaining = 5
            print(
                "You have \(shipsRemaining) ships remaining, and \(guessesRemaining) guesses remaining."
            )

            // Ask for row and column input, and validates the input will be in the grid
            print("\nWhich row would you like to guess. Enter 1-\(size)")
            let rowInput = intInputValidator(minSize: 1, maxSize: size)
            // print(rowInput)

            print("\nWhich column would you like to guess. Enter 1-\(size)")
            let columnInput = intInputValidator(minSize: 1, maxSize: size)
            // print(columnInput)

            // guessesRemaining = guessesRemaining - 1

            // If user input equals the column and row of the ships then replace "~" with "X" and if not then "O"
            // Changes the users input to be in array based format e.g 1 becomes 0

            // Process guesses returns all the users guesses in a new grid if they are valid
            // If the guess isn't valid then return the same grid
            let returnedGuesses = processGuess(
                row: rowInput - 1, col: columnInput - 1, ocean: ocean, guesses: guesses)
            // IF the new grid isn't the same as the old grid then adjust guesses remaining
            if guesses != returnedGuesses {
                guesses = returnedGuesses
                guessesRemaining = guessesRemaining - 1
            }

            printBoard(guesses)
            // print(remainingShips)

            // Call the remainingShips function
            shipsRemaining = remainingShips(ocean: ocean, guesses: guesses)
            // If it = 0 say user won

        }
        // if shipsRemaining != 0 {

        // }

        if shipsRemaining == 0 {
            print("You have won, congratulations.")
        } else {
            print("\nYou have lost")
            print("\nThe ships were here")
            printBoard(ocean)
            // print("You have \(shipsRemaining) ships remaining, and \(guessesRemaining) guesses remaining.")
        }
    }
}
