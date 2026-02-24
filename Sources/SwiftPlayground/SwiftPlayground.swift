// The Swift Programming Language
// https://docs.swift.org/swift-book

// Prints the menu showing the user their input options and checks their input is valid
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
            // print("Value: \(userInput) is okay, return it.")
            return userChoice
        } else {
            print("You entered: \(userInput). Please enter a number on the menue.")
        }
    }
}

// A generic function that is used to validate users input is an int
func intInputValidator() -> Int { 
    while true {
        let userInput = readLine()!
        if let userChoice = Int(userInput) {
            // print("Value: \(userInput) is okay, return it.")
            return userChoice
        } else {
            print("You entered: \(userInput). Please enter a valid input.")
        }
    }
}

// Allows the user to add eggs to their total amount
func addEggs(eggsInInventory: Int, eggsAdded: Int) -> Int { 
    return eggsInInventory + eggsAdded
}
@main

struct SwiftPlayground {
    /// A description
    /// - Parameters:
    ///
    static func main() {
        var totalEggs = 12
        print("\nEgg shop inventory system.")
        // print(menuChoice())

        var isActive = true
        while isActive {

            let userChoice = menuChoice()
            switch userChoice {
            case 1:
                print("How many eggs would you like to add?")
                let userInput = intInputValidator()
                totalEggs = addEggs(eggsInInventory: totalEggs, eggsAdded: userInput)
                print("You have \(totalEggs) eggs in your inventory.")
                // isActive = false

            case 5:
                print ("\nExiting the Egg Shop.")
                isActive = false
            default:
                print("\nInvalid input")
            }
        }
    }
}
