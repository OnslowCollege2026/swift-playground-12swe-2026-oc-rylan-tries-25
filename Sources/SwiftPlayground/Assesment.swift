import Foundation
// The Swift Programming Language
// https://docs.swift.org/swift-book

/* Check List
Kumara shop menu - Done
add kumara stock to the container in kilograms (up to 50kg, the most the bin can take) - Done
view the current stock remaining in kilograms - Done
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
func menuChoice() -> Double {
    print("\n==== Kumara Shop ====")
    print("1. Add Kumara")
    print("2. Sell Kumara")
    print("3. Show current stock")
    print("4. Show Kumara Sales History")
    print("5. Exit")
    print("\nChoose an option:")

    while true {
        let userInput = readLine()!
        if let userChoice = Double(userInput), (1...5).contains(userChoice) {
            return userChoice
        } else {
            print("You entered '\(userInput)', please enter a number on the menu.")
        }
    }
}

/// What: A generic function that is used to validate users input is a Double within a certain range
/// Parameters:
/// - minSize: The minimum size the Double can be
/// - maxSize: The maximum size the Double can be
/// Returns: The user's input if valid
func intInputValidator(minSize: Double, maxSize: Double) -> Double {
    while true {
        let userInput = readLine()!

        if let userChoice = Double(userInput), Double(userInput)! >= minSize,
            Double(userInput)! <= maxSize
        {
            return userChoice
        } else {
            print("You entered '\(userInput)', please enter a valid input.")
        }
    }
}

/// What: A function used to validate users bag input is an Int within a certain range
/// Parameters:
/// - minSize: The minimum size the Int can be
/// - maxSize: The maximum size the Int can be
/// Returns: The user's input if valid
func bagValidator(minSize: Int, maxSize: Int, userInput: Double) -> Int {
    while true {
        let bagInput = readLine()!

        if let userChoice = Int(bagInput), Int(bagInput)! >= minSize,
            Int(bagInput)! <= maxSize
        {
            return userChoice
        } else {
            print("You entered '\(bagInput)', please enter a valid input.")
        }
        if Double(bagInput)! * 5.0 > userInput {
            return Int(bagInput)!
        } else {
        print("\(bagInput) bags cannot hold \(userInput)kgs of kumara.")
        print("Please try again.")
        }
    }
}

/// What: Allows the user to add kumara to the container
/// Parameters:
/// - kumarasIncontainer: How many eggs are currently in the inventory
/// - addamount: How many kumara the user wants to add
/// - maxKumaraInInventory: The maximum amount of eggs the user is allowed in the inventory
/// Returns: Either how many kumara are in the inventory or how many are in the inventory - the amount sold
func addKumaras(kumarasIncontainer: Double, addAmount: Double, maxKumarasIncontainer: Double)
    -> Double
{
    if kumarasIncontainer + addAmount > maxKumarasIncontainer {
        // Work out how many exceeded by
        let exceededAmount = kumarasIncontainer + addAmount - maxKumarasIncontainer
        print(
            "\nYou have exceeded the maximum container of \(maxKumarasIncontainer) amount by \(exceededAmount).\n"
        )

        print(
            "You have added \(maxKumarasIncontainer - kumarasIncontainer) and you have returned \(exceededAmount) back to the supplier.\n"
        )

        return maxKumarasIncontainer
    } else {
        return kumarasIncontainer + addAmount
    }
}

/// What: Allows the user to take Kumaras from their container amount and sell them
/// Parameters:
/// - kumarasIncontainer: How many Kumaras are currently in the container
/// - sellAmount: How many Kumaras the user wants to sell
/// Returns: Either how many Kumaras are in the container currently or how many Kumaras are in the container currently minues how many were sold
func sellKumaras(
    kumarasIncontainer: Double, sellAmount: Double, minKumarasInContainer: Double
)
    -> Double
{
    if kumarasIncontainer - sellAmount < minKumarasInContainer {

        print(
            "You were short of \(sellAmount - kumarasIncontainer) Kumaras, please enter a lower amount."
        )

        return kumarasIncontainer
    } else {
        return kumarasIncontainer - sellAmount
    }
}

func sellKumarasLogic(kumarasIncontainer: Double, minKumarasInContainer: Double, maxKumarasInContainer: Double, quantity: Double, kumaraPrice: Double, bags: Int, bagsPrice: Double, transactions: [[Double]]) -> [[Double]] {

if kumarasIncontainer - quantity < minKumarasInContainer {

        print(
            "You were short of \(quantity - kumarasIncontainer) Kumaras, please enter a lower amount."
        )

        return kumarasIncontainer
    } else {
        return kumarasIncontainer - quantity
    }


var newTransactions = transactions

let transaction: [Double] = [(quantity), (kumaraPrice), Double(bags), (bagsPrice)]

newTransactions.append(transaction)

return newTransactions

}

func printSaleInformation(quantity: Double, kumaraPrice: Double, bags: Int, bagsPrice: Double) {
    let totalPrice = (kumaraPrice * quantity) + ( Double (bags) * bagsPrice)
    let salesSummary = ("\nYou bought \(quantity) kgs of kumara, at $\(String(format: "%.2f", kumaraPrice)) per kg, and you bought \(bags) bag clips with it at $\(String(format: "%.2f", bagsPrice)) per bag. The total price was $\(String(format: "%.2f",totalPrice)).")
    print(salesSummary)
}

func printSummaryInformation(_ transactionHistory: [[Double]], ) {
var sumOfQuantity: Double = 0
var sumOfTotalCost: Double = 0
var sumOfBags: Double = 0

    for row in transactionHistory {
            sumOfQuantity += row[0]
            sumOfBags += row[2]
            sumOfTotalCost += (row[2] * row[3]) + (row[1] * row[0])
        }
        
        print("You've made \(transactionHistory.count) sale/s.")
        if transactionHistory.count > 0 {
        print("You've sold \(sumOfQuantity) kgs of kumara, and made $\(sumOfTotalCost) from those sales.")
        print("Your average kumara sale weight was \(sumOfQuantity / Double(transactionHistory.count))kg")
        print("Your average kumara sale amount was $\(String(format: "%.2f", sumOfTotalCost / sumOfBags )) per bag.")
    } else {
        print("Try making some sales before checking you stats.")
    }
}



@main
struct SwiftPlayground {
    static func main() {

        // Starting values
        var kumarasIncontainer = 0.0
        var bags = 5000
        let minKumarasInContainer = 0.1
        let maxKumarasInContainer = 50.0
        let minBagsBought = 1
        let maxBagsBought = 5000
        let kumaraCost = 3.0
        let bagCost = 0.2

        var transactions : [[Double]] = []

        var isActive = true
        while isActive {

            let userChoice = menuChoice()
            switch userChoice {

            // Allows the user to add Kumaras to their container
            // Checks the integer is valid in all ways
            // Stops the user from exceeding the max Kumara container amount of max Kumaras
            case 1:
                print("\nHow many kgs of kumara would you like to add?")
                let userInput = intInputValidator(
                    minSize: minKumarasInContainer,
                    maxSize: maxKumarasInContainer - kumarasIncontainer)
                kumarasIncontainer = addKumaras(
                    kumarasIncontainer: kumarasIncontainer, addAmount: userInput,
                    maxKumarasIncontainer: maxKumarasInContainer)
                print("You currently have \(kumarasIncontainer)kgs of kumara in your container, and \(bags) bags left.")

            case 2:
                print("\nHow many kgs of kumara would you like to sell?")
                let userInput = intInputValidator(
                    minSize: minKumarasInContainer, maxSize: kumarasIncontainer)
                    kumarasIncontainer = sellKumaras(kumarasIncontainer: kumarasIncontainer, sellAmount: userInput, minKumarasInContainer: minKumarasInContainer)

                print("How many bags do you want?")
                let bagInput = bagValidator(
                    minSize: minBagsBought, maxSize: maxBagsBought, userInput: userInput)

                transactions = sellKumaras(quantity: userInput, kumaraPrice: kumaraCost, bags: bagInput, bagsPrice: bagCost, transactions: transactions )

                printSaleInformation(quantity: userInput, kumaraPrice: kumaraCost, bags: bagInput, bagsPrice: bagCost)
                print("You currently have \(kumarasIncontainer)kgs of kumara in your container, and \(bags) bags left.")


            case 3:
            print("You currently have \(kumarasIncontainer)kgs of kumara in your container, and \(bags) bags left.")

            case 4:
            printSummaryInformation(transactions)

            case 5:
                print("Exiting the Kumara Shop")
                isActive = false

            default:
                print("\nInvalid input")
            }
        }
    }
}
