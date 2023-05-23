import Foundation 

// A Matrix where x and y axes are filled with Rock, Paper, Scissors. 
// X axis is opponent's hand, whereas Y axis is player's hand.
// The intersection denotes the outcome (X, Y, Z) represented by the amount of points won divided by 3.
let matrix : [[Int]] = [
    [1, 2, 0],
    [0, 1, 2],
    [2, 0, 1]
]

let url = URL(filePath: "input.txt")

do {
    let input = try String(contentsOf: url, encoding: .utf8)
    let inputLineComponentsay = input.components(separatedBy: .newlines)

    var sum = 0
    for line in inputLineComponentsay {
        do {
            sum += try parseLine(line) 
        }
    }

    print("total points: \(sum)")
}

func parseLine(_ line: String)  throws -> Int {
    let lineComponents = line.split(separator: " ")

    if lineComponents.count == 0 {
        return 0
    }

    let i: Int
    switch lineComponents[0] {
        case "A":
            i = 0
        case "B":
            i = 1
        case "C":
            i = 2
        default: 
            throw "Invalid input for opponent hand"
    }

    let want: Int
    switch lineComponents[1] {
        case "X":
            want = 0
        case "Y":
            want = 1
        case "Z":
            want = 2
        default: 
            throw "Invalid input for player strategy. Valid input is X, Y, or Z."
    }

    let pointsArray = matrix[i]

    guard let handIndex = pointsArray.firstIndex(where: { $0 == want }) else {
        throw "Did not find the wanted strategy"
    }
    
    return want * 3 + (handIndex + 1)
}

extension String: Error {}
