//
//  main.swift
//  ProgrammingTrainning_FirstExam_q2
//
//  Created by 유용상 on 2023/10/11.
//

import Foundation

func q2(_ n: Int) -> Int {
    var n = n
    let beforeN = n
    var result: String = ""
    dfs(n: &n, result: &result)
    var answer = 0
    var cnt: Int = 16 - result.count
    addZero(result: &result, cnt: &cnt)
    var output:Int = 0
    var idx:Int = 15
    makeOct(result: &result, output: &output, idx: &idx)
    
    
    return output
}
func dfs(n: inout Int, result: inout String){
    if(n == 0){
        return
    }else if(n == 1){
        result += String(n)
        n = n/2
        dfs(n: &n, result: &result)
    }
    else{
       
        result += String(n%2)
        n = n/2
        dfs(n: &n, result: &result)
        
    }
    
    
    
}
func addZero(result: inout String, cnt: inout Int){
    if(cnt != 0){
        cnt -= 1
        result += "0"
        addZero(result: &result, cnt: &cnt)
    }else{
        
    }
}
func makeOct(result: inout String, output: inout Int, idx: inout Int){
    if(result != "0000000000000000" && result != ""){
        output += Int(String(result.first!))! * Int(pow(Float(2),Float(idx)))
        result.removeFirst()
        idx -= 1
        makeOct(result: &result, output: &output, idx: &idx)
    }else{
        
    }
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
    var result2 = 0
    
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
                result = q2(n)
                result2 = q2(result)

                if result2 != n {
                    print("Error")
                }
                
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
