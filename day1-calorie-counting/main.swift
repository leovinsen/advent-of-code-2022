import Foundation

let url = URL(fileURLWithPath: "input.txt")

do {
    let input = try String(contentsOf: url, encoding: .utf8)
    let inputArray = input.components(separatedBy: .whitespacesAndNewlines)
    
    var elves: [Int] = []
    var runningSum = 0

    for calorie: String in inputArray {
        if calorie == "" {
            elves.append(runningSum)
            runningSum = 0
            continue
        }

        runningSum += Int(calorie) ?? 0
    }
    
    elves.sort(by: > )
    let total = elves[0] + elves[1] + elves[2]

    print("Total calories of top 3 elves: \(total)")
    
} catch {
    print("error reading file: \(error)")
}

