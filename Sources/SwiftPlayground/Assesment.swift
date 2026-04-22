// The Swift Programming Language
// https://docs.swift.org/swift-book

/* Check List
Kumara shop menu - Done
add kumara stock to the container in kilograms (up to 50kg, the most the bin can take)
view the current stock remaining in kilograms
view previous sales records
show summary information for the stall owner, including the average weight sold per bag and the average amount earned per bag
The program must allow customers to:

record a sale by entering the total weight sold and the number of bags used
kumara are charged at $3 per kilogram
each bag costs 20 cents
there are 5,000 bags maximum (this does not need to be tested)
the least amount of kumara one can purchase is a single kumara at 100 grams
the most amount of kumara one can purchase is the entire remaining stock, however much it is — but they must be put into bags which can hold, at most, 5 kg each
calculate and display the kumara charge, bag charge, and total charge for the sale
reduce the available stock when a sale is completed
*/


/// What: Prints the menu showing the user their input options and checks their input is valid
/// Returns: The user's input
func menuChoice() -> Int {
    print("\n==== Kumara Shop ====")
    print("1. Add Kumara")
    print("2. Sell Kumara")
    print("3. Show current stock")
    print("4. Show total Kumara sold")
    print("5. Exit")
    print("\nChoose an option:")

    while true {
        let userInput = readLine()!
        if let userChoice = Int(userInput), (1...5).contains(userChoice) {
            return userChoice
        } else {
            print("You entered '\(userInput)', please enter a number on the menu.")
        }
    }
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


@main
struct SwiftPlayground {
    static func main() {
    let userInput = menuChoice()
    print (userInput)
    }
}