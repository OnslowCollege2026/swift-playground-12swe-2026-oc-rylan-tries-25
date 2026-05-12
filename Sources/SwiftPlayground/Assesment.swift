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
func doubleInputValidator(minSize: Double, maxSize: Double) -> Double {
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


/// What: A generic function that is used to validate users Baginput is a Double with some certain criteria range
/// Parameters:
/// - minSize: The minimum size the Double can be
/// - maxSize: The maximum size the Double can be
/// - totalWeight: The amount the bag can be
/// Returns: The user's input if valid
func bagValidator(minSize: Int, maxSize: Int, totalWeight: Double) -> Int {
    while true {
        guard let bagInput = readLine(), let userChoice = Int(bagInput) else {
            print("Please enter a valid input.")
            continue
        }

        // Check if it's within the allowed range
        if userChoice < minSize || userChoice > maxSize {
            print("You entered '\(userChoice)', please enter a value between \(minSize) and \(maxSize).")
            continue
        }

        // Check if the chosen bags can actually hold the weight (assuming 5kg per bag)
        if Double(userChoice) * 5.0 < totalWeight {
            print("\(userChoice) bags cannot hold \(totalWeight)kg of kumara.")
            print("Please try again.")
            continue
        }

        return userChoice
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
/// - minKumarsInContainer: The minimum amount of kumara possible in the container
/// - maxKumarasInContainer: Same of minmum but just maximum
/// - quantity: how many kumara are wanted
/// - kumaraPrice: The price of a kumara
/// - bagsWanted: How many bags the user wants
/// - bags: how many bags are currently in the shop
/// - bagsPrice: The price of a bag
/// - Transactions: The array the tracks all the information in the sale (kumaraWanted and their price + bagsWanted and their price)
/// Returns:  Either how many kumaras are in the container  + how many bags currently + the transaction or how many kumaras are in the container - amount sold  + how many bags currently - amount sold + the transaction

func sellKumarasLogic(kumarasIncontainer: Double, minKumarasInContainer: Double, maxKumarasInContainer: Double, quantity: Double, kumaraPrice: Double, bagsWanted: Int, bags: Int, bagsPrice: Double, transactions: [[Double]]) -> (Double, Int, [[Double]]) {

if kumarasIncontainer - quantity + 0.1 < minKumarasInContainer {

        print(
            "You were short of \(quantity - kumarasIncontainer) Kumaras, please enter a lower amount."
        )

        return (kumarasIncontainer, bags, transactions)
    } else {
        var newTransactions = transactions

if bagsWanted > bags {
    return (kumarasIncontainer, bags, transactions)
} else {

let transaction: [Double] = [(quantity), (kumaraPrice), Double(bagsWanted), (bagsPrice)]

newTransactions.append(transaction)

        return (kumarasIncontainer - quantity, bags - bagsWanted, newTransactions)

        }
    }
}

/// What: prints some texty about the sale info
/// Parameters:
/// - Quantity: how many kumara are wnated
/// - Kumaraprice: The kumara price
/// - bags: How many bags there are
/// - bagsPrice: the price of a bag 
func printSaleInformation(quantity: Double, kumaraPrice: Double, bags: Int, bagsPrice: Double) {
    let totalPrice = (kumaraPrice * quantity) + ( Double (bags) * bagsPrice)
    let salesSummary = ("\nYou bought \(quantity) kgs of kumara, at $\(String(format: "%.2f", kumaraPrice)) per kg, and you bought \(bags) bag clips with it at $\(String(format: "%.2f", bagsPrice)) per bag. The total price was $\(String(format: "%.2f",totalPrice)).")
    print(salesSummary)
}

/// What: Does some math figuring out the sale amounts then prints those amounts in some informative text
/// Parameters:
/// - transactionHistory: A 2d array holding all the transactions made
func printSummaryInformation(_ transactionHistory: [[Double]], ) {
var sumOfQuantity: Double = 0
var sumOfTotalCost: Double = 0
var sumOfBags: Double = 0

    for row in transactionHistory {
            sumOfQuantity += row[0]
            sumOfBags += row[2]
            sumOfTotalCost += (row[0] * row[1]) + (row[2] * row[3])
        }
        
        
        print(sumOfTotalCost)
        print(sumOfBags)

        print("\nYou've made \(transactionHistory.count) sale/s.")
        if transactionHistory.count > 0 {
        print("You've sold \(sumOfQuantity) kgs of kumara, and made $\(sumOfTotalCost) from those sales.")
        print("Your average kumara sale weight was \(sumOfQuantity / Double(transactionHistory.count))kg")
        print("Your average kumara sale amount was $\(String(format: "%.2f", sumOfTotalCost / sumOfBags )) per bag.")
    } else {
        print("Try making some sales before checking you stats.")
    }
}

/// What: The entire transaction history featuring all transactions made. Prints them out in some informative text
/// Parameters:
/// - transactionHistory: A 2d array holding all the transactions made
func printTransactions(_ transactionHistory: [[Double]]) {
    print("Quantity(kg) | Price ($) | Bag Clips | Bag Clips Price ($) | Total Cost ($)")
    print("----------------------------------------------------------------------------")
    for row in transactionHistory {
        let totalPrice = (row[2] * row[3]) + (row[1] * row[0])
    let salesSummary = ("      \(String(format: "%.2f", row[0])) |      \(String(format: "%.2f", row[1])) |      \(row[2]) |      \(String(format: "%.2f", row[3]))) |      \(String(format: "%.2f", (totalPrice))) ")
    print (salesSummary)
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


        // The array holding the transaction info
        var transactions : [[Double]] = []


        // Starts the loop
        var isActive = true
        while isActive {

            let userChoice = menuChoice()
            switch userChoice {

            // Allows the user to add Kumaras to their container
            // Checks the integer is valid in all ways
            // Stops the user from exceeding the max Kumara container amount of max Kumaras
            case 1:
                print("\nHow many kgs of kumara would you like to add?")
                let userInput = doubleInputValidator(
                    minSize: minKumarasInContainer,
                    maxSize: maxKumarasInContainer - kumarasIncontainer)
                kumarasIncontainer = addKumaras(
                    kumarasIncontainer: kumarasIncontainer, addAmount: userInput,
                    maxKumarasIncontainer: maxKumarasInContainer)
                print("You currently have \(String(format: "%.2f", (kumarasIncontainer))) kgs of kumara in your container, and \(bags) bags left.")


            // LEts the user sell kumara from the container and updates the amount, asks for bags too and updates that too
            case 2:

            // Asks user how many kumara wanted and verifies that its a valid input
                print("\nHow many kgs of kumara would you like to sell?")
                let userInput = doubleInputValidator(
                    minSize: minKumarasInContainer, maxSize: kumarasIncontainer)


                // Asks the user 
                print("How many bags do you want?")
                let bagInput = bagValidator(
                    minSize: minBagsBought, maxSize: maxBagsBought, totalWeight: userInput)

                (kumarasIncontainer, bags, transactions) = sellKumarasLogic(kumarasIncontainer: kumarasIncontainer, minKumarasInContainer: minKumarasInContainer, maxKumarasInContainer: maxKumarasInContainer, quantity: userInput, kumaraPrice: kumaraCost, bagsWanted: bagInput,  bags: bags, bagsPrice: bagCost, transactions: transactions)

                printSaleInformation(quantity: userInput, kumaraPrice: kumaraCost, bags: bagInput, bagsPrice: bagCost)
                print("You currently have \(String(format: "%.2f", (kumarasIncontainer))) kgs of kumara in your container, and \(bags) bags left.")


            // Just shows the current stock of the container
        
            case 3:
            print("You currently have \(String(format: "%.2f", (kumarasIncontainer))) kgs of kumara in your container, and \(bags) bags left.")


            // Shows the entire transactions history in a nice lil table
            case 4:
            printSummaryInformation(transactions)

            printTransactions(transactions)

            // Exits the shop
            case 5:
                print("Exiting the Kumara Shop")
                isActive = false

            default:
                print("\nInvalid input")
            }
        }
    }
}

