// The Swift Programming Language
// https://docs.swift.org/swift-book

func menuChoice() -> Int {
    print("\n==== Egg Shop ====")
    print("1. Add eggs")
    print("2. Sell egs")
    print("3. Show current stock")
    print("4. Show total eggs sold")
    print("5. Exit")
    print("\nChoose an option:\n")
    
    while true {
        let userInput = readLine()!
        if let userChoice = Int(userInput) {
            print("Value: \(userInput) is okay, return it.")
            return userChoice
        } else {
            print("you entered: \(userInput). Please enter a number on the menue.")
        }
    }
}
@main

struct SwiftPlayground {
    /// A description
    /// - Parameters:
    ///
    static func main() {
        print(menuChoice())
    }
}
