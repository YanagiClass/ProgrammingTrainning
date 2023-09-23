//
//  main.swift
//  LeetCode206
//
//  Created by 유용상 on 2023/09/23.
//

import Foundation



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func helper(_ head: ListNode?, reversed: ListNode?) -> ListNode? {
        switch head {
        case .some(let root):
            let swapped = root.next
            root.next = reversed
            return helper(swapped, reversed: root)
        case .none:
            return reversed
        }
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        helper(head, reversed: nil)
    }
}


