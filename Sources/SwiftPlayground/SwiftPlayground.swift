// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Prints the menu showing the user their input options and checks their input is valid
func menuChoice() -> Int {
    print("\n==== Egg Shop ====")
    print("1. Add eggs")
    print("2. Sell eggs")
    print("3. Show current stock")
    print("4. Show total eggs sold")
    print("5. Exit")
    print("\nChoose an option:")

    while true {
        let userInput = readLine()!
        if let userChoice = Int(userInput), (1...5).contains(userChoice) {
            return userChoice
        } else {
            print("You entered: \(userInput). Please enter a number on the menue.")
        }
    }
}

/// A generic function that is used to validate users input is an int
func intInputValidator() -> Int {
    while true {
        let userInput = readLine()!
        if let userChoice = Int(userInput) {
            return userChoice
        } else {
            print("You entered: \(userInput). Please enter a valid input.")
        }
    }
}


func intChecker() -> Bool {
    let userInput = readLine()!
    let userInput = Bool [userChoice]
    if userChoice < 0 {
        print ("Adding \(userInput) eggs into the inventory...")
    }
}

/// Allows the user to add eggs to their total amount
func addEggs(eggsInInventory: Int, eggsAdded: Int) -> Int {
    return eggsInInventory + eggsAdded
}

/// Allows the user to take eggs from their total amount and sell them
func sellEggs(eggsInInventory: Int, eggsAdded: Int) -> Int {
    return eggsInInventory - eggsAdded
}
@main

struct SwiftPlayground {
    static func main() {
        var totalEggs = 120
        print("\nEgg shop inventory system.")

        var isActive = true
        while isActive {

            let userChoice = menuChoice()
            switch userChoice {

            case 1:
                print("\nHow many eggs would you like to add?")
                let userInput = intInputValidator()
                totalEggs = addEggs(eggsInInventory: totalEggs, eggsAdded: userInput)
                print("You have \(totalEggs) eggs in your inventory.")

            case 2:
                print("\nHow many eggs would you like to sell")
                let userInput = intInputValidator()
                totalEggs = sellEggs(eggsInInventory: totalEggs, eggsAdded: userInput)
                print("You have \(totalEggs) eggs in your inventory.")

            case 5:
                print("\nExiting the Egg Shop.")
                isActive = false
            default:
                print("\nInvalid input")
            }
        }
    }
}
