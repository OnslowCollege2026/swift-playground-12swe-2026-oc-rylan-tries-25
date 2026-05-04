import Foundation

func sellBread(quantity: Double, breadPrice: Double, bagClips: Int, bagClipsPrice: Double, transactions: [[Double]]) -> [[Double]] {

var newTransactions = transactions

let transaction: [Double] = [(quantity), (breadPrice), Double(bagClips), (bagClipsPrice)]

newTransactions.append(transaction)

return newTransactions

}


func printTransactions(_ transactionHistory: [[Double]]) {
    print("Quantity(kg) | Price ($) | Bag Clips | Bag Clips Price ($) | Total Cost ($)")
    print("----------------------------------------------------------------------------")
    for row in transactionHistory {
        let totalPrice = (row[2] * row[3]) + row[1] * row[0]
    let salesSummary = ("      \(String(format: "%.2f", row[0])) |      \(String(format: "%.2f", row[1])) |      \(row[2]) |      \(String(format: "%.2f", row[3]))) |      \(String(format: "%.2f", (totalPrice))) ")
        print (salesSummary)
        // for value in row {
        //     print(value,separator: "",terminator: " | ")
        // }
        // print(row.joined(separator: "|"))
        // print()
    }
}

func printSaleInformation(quantity: Double, breadPrice: Double, bagClips: Int, bagClipsPrice: Double) {
    let totalPrice = (breadPrice * quantity) + ( Double (bagClips) * bagClipsPrice)
    let salesSummary = ("You bought \(quantity) kgs of bread, at $\(breadPrice), and you bought \(bagClips) bag clips with it at $\(bagClipsPrice). The total price was $\(totalPrice).")
    print(salesSummary)
}

func printSummaryInformation(_ transactionHistory: [[Double]], ) {
var sumOfQuantity: Double = 0
var sumOfTotalCost: Double = 0
var sumOfBagClips: Double = 0

    for row in transactionHistory {
            sumOfQuantity += row[0]
            sumOfBagClips += row[2]
            sumOfTotalCost += (row[2] * row[3]) + (row[1] * row[0])
        }

    
        print("You had made \(transactionHistory.count) sales.")
        if transactionHistory.count > 0 {
        print("You've sold \(sumOfQuantity) kgs of ____, and made $\(sumOfTotalCost) from those sales.")
        print("Your average ______ sale weight was \(sumOfQuantity / Double(transactionHistory.count))kg")
        print("Your average ______ sale amount was $\(String(format: "%.2f", (sumOfTotalCost / sumOfBagClips))) per bag.")
    } else {
        print("Try making some sales before checking you stats.")
    }
}


// @main


var transactions : [[Double]] = []


transactions = sellBread(quantity: 3.5, breadPrice: 7.0, bagClips: 7, bagClipsPrice: 0.4, transactions: transactions)
transactions = sellBread(quantity: 6, breadPrice: 7.0, bagClips: 4, bagClipsPrice: 0.4, transactions: transactions)


// for row in transactions {
//     // print(row)

//     let totalPrice = (row[2] * row[3]) + row[1] * row[0]
//     let salesSummary = ("You bought \(row[0]) kgs of bread, at $\(row[1]), and you bought \(row[2]) bag clips with it at \(row[3]). The total price was \(totalPrice)")
//     print(salesSummary)

// }

printTransactions(transactions)
printSummaryInformation(transactions)
printSaleInformation(quantity: 7, breadPrice: 4, bagClips: 2, bagClipsPrice: 0.2)


















// // struct SwiftPlayground {
// //     static func main() {
    
// // var people: [String: Int] = [:]

// // people["Jeremey"] = 53

// // for (name, age) in people {
// //     print ("\(name) is \(age)")
// // }

// // // // while true {
// // // //     print("Who would you like to check?")
    
// // // //     if let userInput = readLine(), userInput.allSatisfy({ $0.isLetter }) {
// // // //     print("Valid name")
// // // // } else {
// // // //     print("Only letters allowed")
// // // // }
// // // // // print(people)
// // // // if people ["\(userInput)"] == nil {
// // // // print ("\(userInput) is not in the system.")
// // // // } else {
// // // // print("\(userInput) was in the system, and they are \(age).")
// // // // }

// // print("\n...\n")
// // print("1 year has passed.\n")

// // people["Kimberley"] = 52

// // people["Jeremey"] = 54


// // for (name, age) in people {
// //     print ("\(name) is \(age)\n")

// //     }
// // print(people)
// // }
// // }





// // Things we want to store in the transactions
// struct Transaction {
//     var transactionNumber: Int
//     var item: String
//     var price: Double
//     var quantity: Int
//     var time: String
// }

// var transactions: [Transaction] = []

// transactions.append(Transaction(transactionNumber: 1, item: "Apple", price: 2.5, quantity: 3, time: "10:30"))
// transactions.append(Transaction(transactionNumber: 2, item: "Milk", price: 4.0, quantity: 1, time: "11:00"))

// // for t in transactions {
// //     print("Transaction \(t.transactionNumber) was: \(t.item) x\(t.quantity) - $\(String(format: "%.2f", Int(t.price))) at \(t.time)")
// // }



// let number = 3.14159
// print(String(format: "%.2f", number))

// // // // Output:
// // // // 3.14
// // //     }
// // // }

// struct Cheeses {
//     var weight: Double
//     var price: Double
    
// }

// // var receipt: []
// for c in Cheeses  {
// print("You bought \(c.weight)")
// }


// let breadPrice: Double = 3.59
// print("\(breadPrice)")

// var breadPriceString = String(breadPrice) 
// print(breadPriceString)

// var breadPriceInt = Int(breadPrice)
// print(breadPriceInt)

// var breadPriceDouble = Double(breadPriceInt)
// print(breadPriceDouble)

// let myDouble = 3.1
// let formatted = String(format: "%.6f", myDouble) // "3.14"
// print(formatted)



// Doesn't print the trailing zeroes
// let value = 3.1
// let roundedValue = (value * 100).rounded() / 100 // 3.14

// print(roundedValue)

// var transaction: [String] = ["abc"]

// print(transaction)

