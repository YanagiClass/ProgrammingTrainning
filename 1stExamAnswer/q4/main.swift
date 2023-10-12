//
//  main.swift
//  ProgrammingTrainning_FirstExam_q4
//
//  Created by 유용상 on 2023/10/11.
//

import Foundation

func q4(_ n: Int) -> Int {
    var result: Int = 0
    let INF = 1_234_456_789
    var cache = [Int](repeating: INF, count: n + 1)
    cache[1] = 0
    for i in 1...n {
        if i % 2 == 0 {
            cache[i] = min(cache[i], cache[i / 2] + 1)
        }
        cache[i] = min(cache[i], cache[i - 1] + 1)
    }
    result = cache[n]
    return result + 1
}

func compareOutput(file1: String, file2: String) {
    do {
        let contents1 = try String(contentsOfFile: file1, encoding: .utf8)
        let contents2 = try String(contentsOfFile: file2, encoding: .utf8)
        
        let lines1 = contents1.components(separatedBy: .newlines)
        let lines2 = contents2.components(separatedBy: .newlines)
        
        var success = true
        
        for (i, (line1, line2)) in zip(lines1, lines2).enumerated() {
            if line1 != line2 {
                print("[\(i + 1)] Wrong answer: Yours='\(line1)', Expected='\(line2)'")
                success = false
                break
            }
        }
        
        if success {
            print("Success!")
        }
    } catch {
        print("Error reading files: \(error)")
    }
}

func main() {
    // DO NOT EDIT main() function
    
    var K = 0
    var n = 0
    var result = 0
    
    let start_time = CFAbsoluteTimeGetCurrent()

    FileManager.default.createFile(atPath: "output.txt", contents: nil, attributes: nil)
 
    var str = ""
    
    if let inputURL = Bundle.main.url(forResource: "input", withExtension: "txt"),
       let input = try? String(contentsOf: inputURL, encoding: .utf8),
       let outputURL = Bundle.main.url(forResource: "output", withExtension: "txt") {
        
        let inputLines = input.components(separatedBy: .newlines)
        
        if let k = Int(inputLines[0]) {
            K = k
        }
        
        for i in 1..<(K + 1) {
            let line = inputLines[i]
            let components = line.components(separatedBy: " ")
            
            if components.count == 1,
               let a = Int(components[0]) {
                
                n = a
                result = q4(n)

                print(result)
                if str == "" {
                    str = String(result)
                }
                else {
                    str = str + "\n" + String(result)
                }
                do {
                    try str.write(to: outputURL, atomically: true, encoding: .utf8)
                } catch {
                    print("File write error")
                }
            }
        }
        
        if let expectedURL = Bundle.main.url(forResource: "expected", withExtension: "txt") {
            compareOutput(file1: outputURL.path, file2: expectedURL.path)
        }
        
        let end_time = CFAbsoluteTimeGetCurrent()
        print("Elapsed time: \(end_time - start_time) seconds.")
    }
    else {
        print("error?")
    }
}

main()
//print(q4(601098))


