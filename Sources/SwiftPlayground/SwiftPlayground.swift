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
            print("You entered '\(userInput)', please enter a number on the menue.")
        }
    }
}

/// A generic function that is used to validate users input is an int
func intInputValidator() -> Int {
    while true {
        let userInput = readLine()!
        if let userChoice = Int(userInput), Int(userInput)! > 0 {
            return userChoice
        } else {
            print("You entered '\(userInput)', please enter a valid input.")
        }
    }
}

/// Allows the user to add eggs to their total amount
func addEggs(eggsInInventory: Int, addAmount: Int, maxEggsInInventory: Int) -> Int {
    if eggsInInventory + addAmount > maxEggsInInventory {
        // Work out how many exceeded by
        let exceededAmount = eggsInInventory + addAmount - maxEggsInInventory

        print(
            "\nYou have exceeded the maximum inventory of \(maxEggsInInventory) amount by \(exceededAmount).\n"
        )

        print(
            "You have added \(maxEggsInInventory - eggsInInventory) and you have returned \(exceededAmount) back to the supplier.\n"
        )

        return maxEggsInInventory
    } else {
        return eggsInInventory + addAmount
    }
}

// Allows the user to take eggs from their total amount and sell them
func sellEggs(eggsInInventory: Int, sellAmount: Int, totalEggsSold: Int) -> Int {
    // var totalEggsSold = totalEggsSold + sellAmount
    if eggsInInventory - sellAmount < 0 {

        print( 
            "You were short of \(sellAmount - eggsInInventory) eggs, please enter a lower amount."
        )

        return eggsInInventory
    } else {
        return eggsInInventory - sellAmount
    }
}

// Shows the toal amount of eggs sold
func eggsSold (soldAmount: Int) {
    print("You have sold \(soldAmount) eggs.")
}

@main

struct SwiftPlayground {
    static func main() {

// Starting parameters
        var eggsInInventory = 120
        let maxEggsInInventory = 1200
        var totalEggsSold = 0

        print("\nEgg shop inventory system.")

        var isActive = true
        while isActive {

            let userChoice = menuChoice()
            switch userChoice {

            case 1:
                print("\nHow many eggs would you like to add?")
                let userInput = intInputValidator()
                eggsInInventory = addEggs(
                    eggsInInventory: eggsInInventory, addAmount: userInput,
                    maxEggsInInventory: maxEggsInInventory)
                print("You have \(eggsInInventory) eggs in your inventory.")

            case 2:
                print("\nHow many eggs would you like to sell")
                let userInput = intInputValidator()
                let newInInventory = sellEggs(
                    eggsInInventory: eggsInInventory, sellAmount: userInput,
                    totalEggsSold: totalEggsSold)
                    totalEggsSold = totalEggsSold + (eggsInInventory - newInInventory)  
                    eggsInInventory = newInInventory
                print("You have \(eggsInInventory) eggs in your inventory.")

            case 3:
                print("You currently have \(eggsInInventory) in your inventory.")

            case 4:
                eggsSold(soldAmount: totalEggsSold)

            case 5:
                print("\nExiting the Egg Shop.")
                isActive = false
            default:
                print("\nInvalid input")
            }
        }
    }
}
