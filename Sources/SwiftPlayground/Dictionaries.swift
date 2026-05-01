import Foundation
// @main
// struct SwiftPlayground {
//     static func main() {
    
// var people: [String: Int] = [:]

// people["Jeremey"] = 53

// for (name, age) in people {
//     print ("\(name) is \(age)")
// }

// // // while true {
// // //     print("Who would you like to check?")
    
// // //     if let userInput = readLine(), userInput.allSatisfy({ $0.isLetter }) {
// // //     print("Valid name")
// // // } else {
// // //     print("Only letters allowed")
// // // }
// // // // print(people)
// // // if people ["\(userInput)"] == nil {
// // // print ("\(userInput) is not in the system.")
// // // } else {
// // // print("\(userInput) was in the system, and they are \(age).")
// // // }

// print("\n...\n")
// print("1 year has passed.\n")

// people["Kimberley"] = 52

// people["Jeremey"] = 54


// for (name, age) in people {
//     print ("\(name) is \(age)\n")

//     }
// print(people)
// }
// }





// Things we want to store in the transactions
struct Transaction {
    var transactionNumber: Int
    var item: String
    var price: Double
    var quantity: Int
    var time: String
}

var transactions: [Transaction] = []

transactions.append(Transaction(transactionNumber: 1, item: "Apple", price: 2.5, quantity: 3, time: "10:30"))
transactions.append(Transaction(transactionNumber: 2, item: "Milk", price: 4.0, quantity: 1, time: "11:00"))

// for t in transactions {
//     print("Transaction \(t.transactionNumber) was: \(t.item) x\(t.quantity) - $\(String(format: "%.2f", Int(t.price))) at \(t.time)")
// }



let number = 3.14159
print(String(format: "%.2f", number))

// // // Output:
// // // 3.14
// //     }
// // }

struct Cheeses {
    var weight: Double
    var price: Double
    
}

// var receipt: []
// for c in Cheeses  {
// print("You bought \(c.weight)")
// }