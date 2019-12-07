## 힙 정렬

### heap 이란?

완전 이진 트리의 일종으로 우선순위 큐를 위하여 만들어진 자료구조이다. 여러 개의 값 중 최댓값이나 최솟값을 빠르게 찾아내도록 만들어진 자료구조이다. 

### Code by Swift

~~~
import Foundation

var heapArray: [Int] = [323,1,452,34,56,24,356,23,14,67,25]

func heapify(_ count: Int) {
    for i in 0 ..< count {
        var child = i
        while child > 0 {
            let root: Int = (child - 1) / 2
            if heapArray[root] < heapArray[child] {
                let temp: Int = heapArray[child]
                heapArray[child] = heapArray[root]
                heapArray[root] = temp
            }
            child = root
        }
    }
}

func heapSort(_ count: Int) {
    var j: Int = 0
    heapify(count)
    print("\(j)번째: \(heapArray)")
    j += 1
    for i in (0 ..< count).reversed() {
        heapArray.swapAt(0, i)
        heapify(i)
        print("\(j)번째: \(heapArray)")
        j += 1
    }
}

let count: Int = heapArray.count
heapSort(count)

print("힙 결과: \(heapArray)")
~~~

## 시간 복잡도

시간 복잡도란 **알고리즘을 수행할 때 걸리는 시간을 기준으로 효율성을 분석하는 것**이다. 즉 처리 획수가 적은 효율적인 알고리즘을 표기하기 위한 수단으로, 시간 복잡도가 낮을수록 효율성이 좋은 알고리즘이라고 생각하면 된다.

### Big-O 표기법

Big-O 표기법은 CS에서 **대략**을 나타내는 공식적인 개념으로, 최악의 경우에 대한 시간 복잡도를 나타내는 표현 방법 입니다.
**선형 탐색**은 찾는 값이 배열의 맨 끝에 있는 경우가 최악의 경우임으로 **O(n)**으로 나타냅니다.
**버블 정렬**은 n²/2 - n/2로, 대략적으로 **O(n²)**으로 나타냅니다.
**선택 정렬**은 가장 작은 값(혹은 큰 값)을 찾아 제 자리에 찾아주는 방식으로 n-1개의 자료 중에 가장 작은 값을 찾기 위해서 n-1번의 비교가 필요합니다. 즉 버블 정렬과 마찬가지로 (n-1) + (n-2) + ... + 1 이고, 시간복잡도는 **O(n²)**으로 나타냅니다.
**삽입 정렬**은 n개의 자료가 있다면 첫 번째 자료는 정렬이 되어 있다고 생각하고 n-1개의 자료 중 첫 번쨰 자료와 정렬된 자료를 비교하는 정렬로, 비교 횟수는 1 + 2 + ... + (n-1)로, 시간복잡도는 **O(n²)**로 나타냅니다.

![](./cs50Img/bigO.png)

### Big Ω 표기법

Big-O와 반대로 Big Ω는 최선의 경우를 나타내는 표기법 이다.

[돌아가기](https://github.com/kbw2204/swiftNote/blob/master/cs/cs50.md)