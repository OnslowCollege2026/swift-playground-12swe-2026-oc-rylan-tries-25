// The Swift Programming Language
// https://docs.swift.org/swift-book
@main

struct SwiftPlayground {
    static func main() {
        let vocabulary: [[String]] = [
            ["hello", "kia ora", "hatarei", "ono", "whitu"],
            ["goodbye", "haere ra", "kia ora", "taniwha", "waru"],
            ["water", "wai", "kai", "anianiwa", "kawa"],
        ]

        var counter = 0
        var score = 0
        var incorrectAnswerIndices: [Int] = []

        while counter < vocabulary.count {
            let englishWord = vocabulary[counter][0]
            let correctWord = vocabulary[counter][1]
            let allAnswers = vocabulary[counter].dropFirst().shuffled()

            print("Please translate \(englishWord)")
            allAnswers.forEach { answer in
            print("- \(answer)")
            }

            if let userInput = readLine(), userInput.lowercased() == correctWord.lowercased() { score = score + 1
            print("Yes, \(correctWord) is correct!")
            } else {
                incorrectAnswerIndices.append(counter)
                print("Sorry! The correct answer is \(correctWord)")
            }

            counter = counter + 1

            while incorrectAnswerIndices.count > 0 {
                let index = incorrectAnswerIndices[0]
            let englishWord = vocabulary[index][0]
            let correctWord = vocabulary[index][1]
            let allAnswers = vocabulary[index].dropFirst().shuffled()

            print("Please translate \(englishWord)")
            allAnswers.forEach { answer in
            print("- \(answer)")
            }

            if let userInput = readLine(), userInput.lowercased() == correctWord.lowercased() {
                incorrectAnswerIndices.removeFirst()
            print("Yes, \(correctWord) is correct!")
            } else {
                incorrectAnswerIndices.append(counter)
                print("Sorry! The correct answer is \(correctWord)")
            }

            counter = counter + 1

        }

        print("You have a score of \(score)/\(vocabulary.count)")
        if Double(score) >= Double(vocabulary.count / 2) {
            print("Congratulations!")
        } else {
            print("Try again next time.")
        }
    }
}
}