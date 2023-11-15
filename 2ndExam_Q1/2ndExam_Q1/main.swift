//
//  main.swift
//  2ndExam_Q1
//
//  Created by 유용상 on 2023/11/08.
//

import Foundation


func q1(coinmap: [[Character]], _ n: Int, _ m: Int) -> Int {
    var result = 0
    var coinmap = coinmap
    for y in 0..<coinmap.count{
        for x in 0..<coinmap[y].count{
            if(coinmap[y][x] == "O"){
           
                    
                var count = 0
                var index:[[Int]] = []
                helper(coinmap: &coinmap, y, x, count: &count, index: &index)
                
                for i in index{
                    for j in i{
                        if(j == 0 || i[0] == coinmap.count - 1 || i[1] == m-1){
                            count = 0
                        }else{
                          
                        }
                    }
                   
                }
                
                result += count
  
                
            }
        }
    }
    
    return result
    
}

func helper(coinmap: inout [[Character]], _ n: Int, _ m: Int, count: inout Int, index: inout [[Int]]){
    
    if(n < 0 || n >= coinmap.count || m < 0 || m >= coinmap[n].count || coinmap[n][m] == "X"){
        return
    }

    
    


    count += 1
    coinmap[n][m] = "X"
    index.append([n,m])
    helper(coinmap: &coinmap, n+1, m, count: &count, index: &index)
    helper(coinmap: &coinmap, n-1, m, count: &count, index: &index)
    helper(coinmap: &coinmap, n, m+1, count: &count, index: &index)
    helper(coinmap: &coinmap, n, m-1, count: &count, index: &index)
    
    
    
    
    
    
    
    
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
    var m = 0
    var idx = 0
    
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
      
        idx = 1
        for _ in 1..<(K + 1) {
            let line = inputLines[idx]
            idx = idx + 1
            let components = line.components(separatedBy: " ")
            
            if components.count == 2,
                let a = Int(components[0]),
                let b = Int(components[1]) {
                
                n = a
                m = b

                var coinmap = [[Character]]()
                for _ in 0..<n {
                    let line = inputLines[idx]
                    idx = idx + 1
                    let row = Array(line)
                    guard row.count == m else {
                        fatalError("Input file format is incorrect")
                    }
                    coinmap.append(row)
                }
            
                let result = q1(coinmap: coinmap, n, m)

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

print(q1(coinmap: [["X","O","X","X","X"], ["X","O","X","O","X"], ["X","X","O","O","X"],["X","X","X","X","X"]], 4, 5))
