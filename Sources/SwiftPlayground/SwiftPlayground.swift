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
func addEggs(EggsInInventory: Int, eggsAdded: Int, maxEggsInInventory: Int) -> Int {
    if EggsInInventory + eggsAdded > maxEggsInInventory {
        // Work out how many exceeded by
        let exceededAmount = EggsInInventory + eggsAdded - maxEggsInInventory

        print(
            "\nYou have exceeded the maximum inventory of \(maxEggsInInventory) amount by \(exceededAmount).\n"
        )

        print(
            "You have added \(maxEggsInInventory - EggsInInventory) and you have returned \(exceededAmount) back to the supplier.\n"
        )

        return maxEggsInInventory
    } else {
        return EggsInInventory + eggsAdded
    }
}

// Allows the user to take eggs from their total amount and sell them
func sellEggs(EggsInInventory: Int, eggsSold: Int, totalEggsSold: Int) -> Int {
    var totalEggsSold = totalEggsSold + eggsSold
    if EggsInInventory - eggsSold < 0 {

        print(
            "You have sold the maximum amount of eggs possible of \(EggsInInventory), because you were short of \(eggsSold - EggsInInventory)."
        )

        return 0
    } else {
        return EggsInInventory - eggsSold
    }
}

func totalEggsSold (totalEggsSold: Int, eggsSold: Int) -> Int {
    let totalEggsSold = totalEggsSold + eggsSold
    return totalEggsSold
}
@main

struct SwiftPlayground {
    static func main() {

        var EggsInInventory = 120
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
                EggsInInventory = addEggs(
                    EggsInInventory: EggsInInventory, eggsAdded: userInput,
                    maxEggsInInventory: maxEggsInInventory)
                print("You have \(EggsInInventory) eggs in your inventory.")

            case 2:
                print("\nHow many eggs would you like to sell")
                let userInput = intInputValidator()
                EggsInInventory = sellEggs(
                    EggsInInventory: EggsInInventory, eggsSold: userInput,
                    totalEggsSold: totalEggsSold)
                print("You have \(EggsInInventory) eggs in your inventory.")

            case 3:
                print("You currently have \(EggsInInventory) in your inventory.")

            case 4:
                print("You have sold \(totalEggsSold) eggs.")
                totalEggsSold(totalEggsSold:totalEggsSold, eggSold)

            case 5:
                print("\nExiting the Egg Shop.")
                isActive = false
            default:
                print("\nInvalid input")
            }
        }
    }
}
