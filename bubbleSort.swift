
import Foundation
func bubbleSort<Element>(source arr: [Element]) -> [Element] where Element : Comparable {
    if arr.count < 2 {
        return arr
    }
    var result = arr
    var i = result.index(before: arr.endIndex)
    while i >= result.startIndex {
        var j = result.index(before: i)
        while j >= result.startIndex {
            if result[i] < result[j] {
                result.swapAt(i, j)
            }
            j = result.index(before: j)
        }
        i = result.index(before: i)
    }
    return result
}
let arr = [1, 8, 2.0, 99, 44, 3]
print(bubbleSort(source: arr))
