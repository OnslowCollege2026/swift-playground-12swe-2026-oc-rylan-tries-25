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

/// What: A generic function that is used to validate users input is an Double within a certain range
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

func addKumaras(KumarasIncontainer: Double, addAmount: Double, maxKumarasIncontainer: Double)
    -> Double
{
    if KumarasIncontainer + addAmount > maxKumarasIncontainer {
        // Work out how many exceeded by
        let exceededAmount = KumarasIncontainer + addAmount - maxKumarasIncontainer

        print(
            "\nYou have exceeded the maximum container of \(maxKumarasIncontainer) amount by \(exceededAmount).\n"
        )

        print(
            "You have added \(maxKumarasIncontainer - KumarasIncontainer) and you have returned \(exceededAmount) back to the supplier.\n"
        )

        return maxKumarasIncontainer
    } else {
        return KumarasIncontainer + addAmount
    }
}

/// What: Allows the user to take Kumaras from their container amount and sell them
/// Parameters:
/// - KumarasInContainer: How many Kumaras are currently in the container
/// - sellAmount: How many Kumaras the user wants to sell
/// Returns: Either how many Kumaras are in the container currently or how many Kumaras are in the container currently minues how many were sold
func sellKumaras(KumarasIncontainer: Double, sellAmount: Double) -> Double {
    if KumarasIncontainer - sellAmount < 0 {

        print(
            "You were short of \(sellAmount - KumarasIncontainer) Kumaras, please enter a lower amount."
        )

        return KumarasIncontainer
    } else {
        return KumarasIncontainer - sellAmount
    }
}

/// Shows the toal amount of Kumaras sold
/// Parameters:
/// - soldAmount: How many Kumaras were sold
func KumarasSold(soldAmount: Double) {
    print("You have sold \(soldAmount) Kumaras.")
}

@main
struct SwiftPlayground {
    static func main() {

        // Starting values
        var kumarasInContainer = 0.0
        let maxKumarasInContainer = 50.0

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
                    minSize: 0, maxSize: maxKumarasInContainer - kumarasInContainer)
                kumarasInContainer = addKumaras(
                    KumarasIncontainer: kumarasInContainer, addAmount: userInput,
                    maxKumarasIncontainer: maxKumarasInContainer)
                print("You have \(kumarasInContainer)kg of Kumara in your container.")

            case 2:
                print("How many kumara would you like to sell")
                print("How many bags do you want ")


            case 5:
                print("Exiting the Kumara Shop")
                isActive = false

            default:
                print("\nInvalid input")
            }
        }
    }
}
