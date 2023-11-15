//
//  main.swift
//  Programmers_makeBigNum
//
//  Created by 유용상 on 2023/11/15.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var answer = ""
    
    var k:Int = k
    let numbers:[Character] = Array(number)
    let n: Int = numbers.count
    var stack:[Character] = []
    for num in numbers{
        //스택이 비어있지 않으며, 스택의 마지막 값이 뽑으려는 값보다 작을경우에 스택 마지막부분을 지우고 k를 1만큼줄인다
        // k를 1만큼 줄인다는건 뽑을 수를 하나 줄인다는것
        while !stack.isEmpty && k > 0 && stack.last!.wholeNumberValue! < num.wholeNumberValue! {
            stack.removeLast()
            k -= 1
        }
        
        if stack.count < n - k {
            stack.append(num)
        }
    }
    return String(stack)
}
    
solution("1231234", 3)
//    var maxNum:String = ""
//    var numArray: [[String]]
//    var number = number
//    var numberArray:[String] = []
//    var intArray:[Int] = []
//    for n in number{
//        numberArray.append(String(n))
//    }
//
//
//    var k = number.count - k
//    numArray = permutation(numberArray, k)
//    var numArrayToInt: [Int] = []
//
//    print(numArray)
//    for num in numArray{
//        var number:String = ""
//        for n in num{
//            number.append(n)
//        }
//        guard let intNumber = Int(number) else { return maxNum }
//        intArray.append(intNumber)
//    }
//
//
//
//    var res = String(intArray.max() ?? 0)
//
//    return res
//}
//
//func permutation<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
//    var result = [[T]]()
//    if array.count < n { return result }
//
//    var visited = Array(repeating: false, count: array.count)
//
//    func cycle(_ now: [T]) {
//        if now.count == n {
//            result.append(now)
//            return
//        }
//
//        for i in 0..<array.count {
//            if visited[i] {
//                continue
//            } else {
//                visited[i] = true
//                cycle(now + [array[i]])
//                visited[i] = false
//            }
//        }
//    }
//
//    cycle([])
//
//    return result


