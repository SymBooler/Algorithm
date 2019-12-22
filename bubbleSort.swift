
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

func selectSort<Element>(source arr: [Element]) -> [Element] where Element : Comparable {
        if arr.count < 2 {
            return arr
        }
        var i = arr.startIndex
        var resultArr = arr
        while i < resultArr.endIndex {
            var minIndex = i
            var j = resultArr.index(after: i)
            while j < resultArr.endIndex {
                if resultArr[j] < resultArr[minIndex] {
                    minIndex = j
                }
                j = resultArr.index(after: j)
            }
            resultArr.swapAt(minIndex, i)
            i = resultArr.index(after: i)
        }
        return resultArr
    }
    
    func insertSort<Element>(source arr: [Element]) -> [Element] where Element : Comparable {
        guard arr.count >= 2 else {
            return arr
        }
        
        var resultArr = arr
        var i = resultArr.index(after: resultArr.startIndex)
        while i < resultArr.endIndex {
            let temp = resultArr[i]
            var j = resultArr.index(before: i)
            while j >= resultArr.startIndex, resultArr[j] > temp {
                j = resultArr.index(before: j)
            }
            var k = i
            while k > resultArr.index(after: j) {
                resultArr[k] = resultArr[resultArr.index(before: k)]
                k = resultArr.index(before: k)
            }
            resultArr[k] = temp
            
            i = resultArr.index(after: i)
        }
        
        return resultArr
    }
    
    func shellSort<Element>(source arr: [Element]) -> [Element] where Element : Comparable {
        guard arr.count >= 2 else {
            return arr
        }
        debugPrint(arr)
        var resultArr = arr
        var distance = resultArr.count / 2
        while distance > 0 {
            var i = distance
            while i < resultArr.count {
                let temp = resultArr[i]
                var k = i-distance
                while k >= 0, temp < resultArr[k] {
                    resultArr[k + distance] = resultArr[k]
                    k -= distance
                }
                resultArr[k + distance] = temp
                i += 1
            }
            
            distance = distance / 2
            
            debugPrint(resultArr)
        }
        
        return resultArr
    }
    //no recursive
    func mergeSort<Element>(source arr: [Element]) -> [Element] where Element : Comparable {
        guard arr.count >= 2 else {
            return arr
        }
        debugPrint(arr)
        var resultArr = arr
        var i = 1
        while i < resultArr.count {
            var l = 0
            var mid = l + i
            var r = mid + i
            while r <= resultArr.count {
                merge(target: &resultArr, l: l, mid: mid, r: r)
                l = r
                mid = l + i
                r = mid + i
            }
            if l < resultArr.count, mid <= resultArr.count {
                merge(target: &resultArr, l: l, mid: mid, r: resultArr.count)
            }
            i *= 2
            debugPrint(resultArr)
        }
        return resultArr
    }
    
    func merge<Element>(target arr: inout [Element], l: Int, mid: Int, r: Int) where Element : Comparable {
        var tempArr = [Element]()
        var i = l
        var j = mid
        while i < mid, j < r {
            if arr[i] <= arr[j] {
                tempArr.append(arr[i])
                i += 1
            } else {
                tempArr.append(arr[j])
                j += 1
            }
        }
        while i < mid {
            tempArr.append(contentsOf: arr[i..<mid])
            i += 1
        }
        while j < r {
            tempArr.append(contentsOf: arr[j..<r])
            j += 1
        }
        for (i, e) in tempArr.enumerated() {
            arr[l+i] = e
        }
    }
    
    func quickSort<Element>(source arr: [Element]) -> [Element] where Element : Comparable {
        var resultArr = arr
        quickSort(source: &resultArr, left: 0, right: resultArr.count-1)
        return resultArr
    }
    
    func quickSort<Element>(source arr: inout [Element], left: Int, right: Int) where Element : Comparable {
        var l = left
        while l < right {
            let mid = partition(source: &arr, left: l, right: right)
            quickSort(source: &arr, left: l, right: mid-1)
//            quickSort(source: &arr, left: mid+1, right: right)
            l = mid + 1
        }
    }
    
    func partition<Element>(source arr: inout [Element], left: Int, right: Int) -> Int where Element : Comparable {
        let pivot = arr[left]
        var i = left + 1
        var j = right
        while true {
            while i <= j, arr[i] <= pivot {
                i+=1
            }
            while i <= j, arr[j] >= pivot {
                j-=1
            }
            if i >= j {
                break
            }
            arr.swapAt(i, j)
        }
        arr.swapAt(left, j)
        debugPrint(arr)
        return j
    }
    
    func heapSort<Element>(source arr: [Element]) -> [Element] where Element : Comparable {
        guard arr.count >= 2 else {
            return arr
        }
        var resultArr = arr
        var endIndex = resultArr.count - 1
        let maxParent = (endIndex - 1)/2
        var parent = maxParent
        while parent >= 0 {
            downAjust(source: &resultArr, parent: parent, endIndex: resultArr.count - 1)
            parent -= 1
        }
        debugPrint(resultArr)
        while endIndex > 0 {
            resultArr.swapAt(0, endIndex)
            endIndex -= 1
            downAjust(source: &resultArr, parent: 0, endIndex: endIndex)
            debugPrint(resultArr)
        }
        return resultArr
    }
    
    func downAjust<Element>(source arr: inout [Element], parent: Int, endIndex: Int) where Element : Comparable {
        var child = parent * 2 + 1
        let temp = arr[parent]
        var p = parent
        while child <= endIndex {
            if child+1 <= endIndex, arr[child+1] > arr[child] {
                child += 1
            }
            if temp >= arr[child] {
                break
            }
            arr[p] = arr[child]
            p = child
            child = p * 2 + 1
        }
        arr[p] = temp
//        debugPrint(arr)
    }

let arr = [1, 8, 2.0, 99, 44, 3]
print(bubbleSort(source: arr))
