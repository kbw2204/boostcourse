## Array

Swift에서의 Array는 C의 배열과 같은 개념이에요. a라는 배열이 있으면 a[0] = 1 이런식으로 값을 넣을 수 도 있고 값 접근도 가능하죠. 그럼 지금부터 Swift의 Array에 대해서 알아볼게요!

### Array 생성

```swift
// 값이 없는 array 생성
let arr: [Int] = []
let arr: [Int] = [Int]()
let arr: [Int] = Array<Int>()
let arr: [Int] = Array()

// 값이 있는 array 생성
let arr: [Int] = [1,3,6]
let arr: [Int] = [1...4]
let arr: [Int] = Array<Int>(1...4) // [1,2,3,4]
let arr: [Int] = Array(arrayLiteral: 1,2,3,4) // [1,2,3,4]

// 반복 데이터 array 생성
let arr: [Int] = [Int](repeating: 0, count: 3) // [0,0,0]
let arr: [Int] = Array(repeating: 0, count: 3) // [0,0,0]
```

### 값 접근

```swift
var arr: [Int] = [0,2,3,4]
arr[0] // 0
arr[0] = 1
print(arr) // [1,2,3,4]
arr.first // 1
arr.last // 4
arr.endIndex // 4
print(arr[arr.endIndex]) // err, 인덱스값 초과
```

### 값 추가

```swift
let arr: [Int] = [1,2,3,4]

// 1. append
arr.append(5) // [1,2,3,4,5]
arr += [6,7,8] // [1,2,3,4,5,6,7,8]

// 2. insert
arr.insert(0, at: 0) // [0,1,2,3,4,5,6,7,8]

// 배열 합치기
let arr2 = [9,10] // let var 상관 x
arr + arr2 // [0,1,2,3,4,5,6,7,8,9,10]
```

### 값 제거

```swift
var arr: [Int] = [1,2,3,4]
// 첫번째 값 제거
print(arr.removeFirst()) // 1
print(arr.remove(at: 0)) // 2

// 마지막 값 제거
print(removeLast()) // 4
print(arr.remove(at: arr.count-1)) // 3
arr = [1,2,3,4] // 초기화해주고
// popLast는 리턴값이 옵셔널이라 null이 와도 err가 안나요!
popLast() // 4

// 값 전체 제거
arr.removeAll() // []
arr.popLast() // nil

arr = [1,2,3,4] // 초기화해주고

// 특정값 제외한 array 리턴하기! 원래값은 변동 x
arr.dropLast() // [1,2,3]
arr // [1,2,3,4]

arr.dropFist() // [2,3,4]
arr // [1,2,3,4]
```

### 값 끼어넣기

```swift
var arr: [Int] = [1,2,3,4]
arr[1...2] // [2,3]
arr[1...2] = [0,0,0] // [0,0,0]
print(arr) // [1,0,0,0,4]
```



오늘은 Array에 대해 알아봤어요! Swift는 코딩테스트 문제풀때 String과 Array에서 자꾸 다시 보게되더라구요.. 반복적으로 보면서 익숙해져야 할 것 같아요!