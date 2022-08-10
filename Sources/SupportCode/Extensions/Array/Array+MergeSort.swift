//
//  Array+MergeSort.swift
//  
//
//  Created by Алексей Филиппов on 04.08.2022.
//

// Apple
import Foundation

public extension Array where Element: Comparable {
    // MARK: - Interface methods
    /// Сортировка слиянием
    /// - Parameter by: Блок сравнения элементов. Стандартное значение - "(<)"
    /// - Returns: Отсортированный новый массив
    func mergeSort(by: ((Element, Element) -> Bool) = (<)) -> [Element] {
        return startMergeSort(data: self, by: by)
    }
    
    // MARK: - Private methods
    private func startMergeSort(data: [Element],
                                by compareHandler: ((Element, Element) -> Bool)) -> [Element] {
        let count = data.count
        if count <= 1 {
            return data
        }
        let halfCount = Int(count / 2)
        let leftArray = Array(data[0 ..< halfCount])
        let rightArray = Array(data[halfCount ..< count])
        return merge(left: startMergeSort(data: leftArray, by: compareHandler),
                     right: startMergeSort(data: rightArray, by: compareHandler),
                     by: compareHandler)
    }
    
    private func merge(left: [Element],
                       right: [Element],
                       by compareHandler: ((Element, Element) -> Bool)) -> [Element] {
        var output: [Element] = []
        var mutableLeft = left
        var mutableRight = right
        while mutableLeft.count > 0 && mutableRight.count > 0 {
            if let firstElement = mutableLeft.first,
               let secondElement = mutableRight.first {
                if compareHandler(firstElement, secondElement) == false {
                    output.append(secondElement)
                    mutableRight.remove(at: 0)
                } else {
                    output.append(firstElement)
                    mutableLeft.remove(at: 0)
                }
            }
        }
        output.append(contentsOf: mutableLeft)
        output.append(contentsOf: mutableRight)
        return output
    }
}
