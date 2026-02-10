// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    /// A description
    /// - Parameters:
    ///
    static func main() {
        let maximumItemVolume = 2.0

        print("Enter room length:")
        guard let userInput = readLine(), let roomLength = Double(userInput) else {

            print("Invalid number.")
        }
        print("Enter room Width:")
        guard let userInput = readLine(), let roomWidth = Double(userInput) else {

            print("Enter room Height:")
            guard let userInput = readLine(), let roomHeight = Double(userInput) else {
                let roomArea = roomLength * roomWidth
                let roomVolume = roomArea * roomHeight

                print("Room area: \(roomArea) m^2")
                print("Room area: \(roomVolume) m^3")

                let furnitureVolumes = [1.2, 0.8, 2.5, 0.6, 1.0]

                var totalFurnitureVolume = 0.0

                furnitureVolumes.enumerated().forEach { index, volume in
                    print("Item \(index + 1): \(volume) m^3")
                    if volume > maximumItemVolume {
                        print("Oversized item detected.")
                    }
                    totalFurnitureVolume = totalFurnitureVolume + volume
                }

                let usableVolume = roomVolume - totalFurnitureVolume
                print("Usable volume: \(usableVolume) m^3.")

            }
        }
    }
}
