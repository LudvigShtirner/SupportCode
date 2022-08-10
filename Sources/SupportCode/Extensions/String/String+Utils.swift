//
//  String+Utils.swift
//  SupportCode
//
//  Created by Филиппов Алексей on 16.05.2022.
//

import Foundation

public extension String {
    /// Renamed count property
    var length: Int {
        return count
    }
    
    /// Obtain character from string by index
    subscript (index: Int) -> String? {
        if index >= length {
            return nil
        }
        return self[index ..< index + 1]
    }
    
    /// Create substring from index to end
    /// - Parameter fromIndex: substring's start index
    /// - Returns: substring of string from index
    func substring(fromIndex: Int) -> String {
        if length == 0 {
            return ""
        }
        return self[min(fromIndex, length - 1) ..< length]
    }
    
    /// Create substring from start to index
    /// - Parameter toIndex: substring's end index
    /// - Returns: substring of string to index
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, min(length, toIndex))]
    }
    
    /// Obtain characters in range
    subscript (range: Range<Int>) -> String {
        @Restricted(0 ... length) var lowerValue = range.lowerBound
        @Restricted(0 ... length) var upperValue = range.upperBound
        let closedRange = lowerValue ..< upperValue
        let start = index(startIndex, offsetBy: closedRange.lowerBound)
        let end = index(start, offsetBy: closedRange.upperBound - closedRange.lowerBound)
        return String(self[start ..< end])
    }
    
    //    func contains(_ searchString: String,
    //                  typoCount: UInt) -> Bool {
    //        if searchString.isEmpty {
    //            return true
    //        }
    //        let lowercasedSelf = self.lowercased()
    //        let searchLowercased = searchString.lowercased()
    //        let searchChar = Array(searchLowercased)[0]
    //        guard let firstIndex = lowercasedSelf.firstIndex(of: searchChar) else {
    //            if typoCount == 0 {
    //                return false
    //            }
    //            if searchLowercased.count < 1 {
    //                return false
    //            }
    //            let selfSubstring = lowercasedSelf.substring(fromIndex: 1)
    //            let searchSubstring = searchLowercased.substring(fromIndex: 1)
    //            return selfSubstring.contains(searchSubstring,
    //                                          typoCount: typoCount - 1)
    //        }
    //        if searchLowercased.count < 1 {
    //            return true
    //        }
    //        let charIndex = lowercasedSelf.distance(from: lowercasedSelf.startIndex,
    //                                                to: firstIndex)
    //        let selfSubstring = lowercasedSelf.substring(fromIndex: charIndex)
    //        let searchSubstring = searchLowercased.substring(fromIndex: 1)
    //        return selfSubstring.contains(searchSubstring,
    //                                      typoCount: typoCount)
    //    }
}
