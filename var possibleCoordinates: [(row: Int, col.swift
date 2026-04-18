var possibleCoordinates: [(row: Int, col: Int)] = []
for r in 0..<10 {
    for c in 0..<10 {
        possibleCoordinates.append((row: r, col: c))
    }
}


print (possibleCoordinates)
// 2. Shuffle them once
possibleCoordinates.shuffle()

// 3. Take one from the end whenever you need a unique spot
let firstShipLocation = possibleCoordinates.removeLast()
let secondShipLocation = possibleCoordinates.removeLast()

print (firstShipLocation)
print (secondShipLocation)