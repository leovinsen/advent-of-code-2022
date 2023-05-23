import Foundation 

let url = URL(filePath: "input.txt")

do {
    let input = try String(contentsOf: url, encoding: .utf8)
    let inputArray = input.components(separatedBy: .newlines)

    var sum = 0
    for line in inputArray {
        do {
            sum += try parseLine(line) 
        }
    }

    print("total points: \(sum)")
}

func parseLine(_ line: String)  throws -> Int {
    let arr = line.split(separator: " ")

    if arr.count == 0 {
        return 0
    }

    let opponent: Shape 
    switch arr[0] {
        case "A":
            opponent = .rock
        case "B":
            opponent = .paper
        case "C":
            opponent = .scissors
        default: 
            throw "Invalid input for opponent hand"
    }

    let player: Shape 
    switch arr[1] {
        case "X":
            player = .rock
        case "Y":
            player = .paper
        case "Z":
            player = .scissors
        default: 
            throw "Invalid input for player hand"
    }

    return calculatePoints(opponent: opponent, player: player)
}

func calculatePoints(opponent: Shape, player: Shape) -> Int {
    var points : Int = 0
    if opponent == player {
        points = 3
    } else if (opponent == .rock && player == .paper) || (opponent == .paper && player == .scissors) || (opponent == .scissors && player == .rock){
        points = 6
    } else {
        points = 0
    }
    
    return points + player.rawValue 
}

enum Shape: Int {
 case rock = 1
 case paper = 2
 case scissors = 3
}

extension String: Error {}
