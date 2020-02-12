## [Swift] Map, Filter, Reduce



안녕하세요! 오늘은 알아두면 아주 편하고 유용하게 사용할 수 있는 Map, Filter, Reduce 고차함수에 대해 알아볼꺼에요.

> 고차함수..?

Swift에선 특이하게 함수를 다른함수의 전달인자로써 사용을 할 수가 있어요. 고차함수는 **"다른 함수를 전달인자로 받거나 함수실행의 결과를 함수로 반환하는 함수"**를 **고차함수**라고 해요.

> 크흠.. 전달인자..?

예를들어서..

```swift
func sum(_ a: Int, _ b: Int) -> Int {
  return a + b
} // 매개변수: a, b

// ...

sum(10, 20) // 전달인자: 10, 20
```

라는 sum 메소드가 있다면 a와 b는 매개변수이고, sum(10, 20) 과 같이 함수에 값을 넣은 10과 20과 같은 값들을 전달인자라고 해요.



#### 사용할 수 있는 타입

고차함수인 map, filter, reduce를 사용할 수 있는 타입은 Sequence, Collection 프로토콜을 따르는 타입인

- Array
- Dictionary
- Set

에서 사용할 수 있어요! 



그럼 지금부터 고차함수인 Map, Filter, Reduce에 대해 설명해볼게요.

> 고차함수를 잘 쓰면 여러줄로 풀던 소스들이 한줄만 사용하면 끝나서 편하고 재밋고 멋진 기능이에요! 이 포스팅이 도움이 되셨길 바래요.

### Map

map은 꼭 for문 같이 여러 값들을 접근할 수 있는 고차함수에요. 예시를 보면 어떤식으로 사용하는건지 감이 오실거에요.



##### ex1)

```swift
// 이런 array가 있을때
let array: [Int] = [1,2,3,4,5]

// array의 값들을 Int형이 아니라 String으로 각각 바꾸고 싶다면,
let stringArray: [String] = array.map({ (num: Int) -> String in
	return String(num)
})
// stringArray = ["1", "2", "3", "4", "5"]
// 요런식으로 모든 값들을 바꿔줄 수 있어요. 하지만 한줄이 아니죠?? 더 간단하게 바꿀 수 있어요. 바로 클로저를 사용하면 되죠.

let stringArray2: [String] = array.map{String($0)}
// num과 같은 인자값들 $0로 함축적으로 표현할 수 있어요. 편하죠??
```

map의 활용도는 다양해요. 위와같이 값들의 자료형들을 바꿔줄 수도 있고 값을 변형해서 return 할 수도 있죠.



##### ex2)

```swift
let array: [Int] = [1,2,3,4]

let arrayDouble: [Int] = array.map{$0*2}
// arrayDouble = [2,4,6,8]
```

Int형 배열인 array를 인자값으로 삼아서 새로운 array값을 return하는게 바로 map의 기능이죠. 하지만 여기서 더 멋진건 map을 사용한 후에 연속적으로 앞으로 알아볼 filter, reduce를 동시에 쭉쭉 사용할 수 있다는 거에요.



## Filter

filter는 array, dictionary, set과 같은 collection타입에 if문과 같은 특정 조건에 만족하는 부분들만 걸러낼 수 있는 기능이에요. 



##### ex1)

```swift
let array: [Int] = [1,2,3,4]

let arrayTimes: [Int] = array.map{$0*3}
// [3,6,9,12]

let result: [Int] = arrayTimes.filter{ (num: Int) -> Bool in
	return num % 2 == 0}
// [6,12]
```

이런식으로 array에서 특정 조건에 대해 True인 값들만 모아서 return해주는 기능이 바로 filter 입니다. filter 또한 클로저를 사용해서 더 간결하게 사용할 수 있고, map과 함께 바로 이어서 사용할 수 있어요.(순서 상관 없어용)



##### ex2)

```swift
let array: [Int] = [1,2,3,4]
let result: [Int] = array.map{$0*3}.filter{$0%2 == 0}
// [6, 12]
```

엄청나죠?? 저는 이 함수들을 알고 신세계였습니다.. 그럼 마지막으로 reduce에 대해 알아볼게요.

## reduce

map은 collection 타입들의 각각의 값들을 접근할 수 있었고, filter는 값들의 특정 조건만 걸러서 가져올 수 있었죠? 그래서 return값 또한 collection타입이였어요.

반면에 reduce는 collection타입들을 한대로 뭉쳐주는 기능을 해요. 가장 좋은예가 합 이라고 생각을 해요.



##### ex1)

```swift
let array: [Int] = [1,2,3,4]
let sum: Int = array.reduce(0, {(a: Int, b: Int) -> Int in
	return a + b
})
print(sum) // 10
```

reduce(초기값, {메소드}) 라고 생각하시면 되요. 이것 또한 다른 고차함수와 함께 사용할 수 있고 클로저를 사용하면 더 간단하게 사용 가능합니다.



##### ex2)

```swift
let array: [Int] = [1,2,3,4]

let result = array.filter{$0%2 == 0}.map{String($0)}.reduce("",{$0 + $1}) // "24"
print(result) // 24
```

[1,2,3,4]인 array 중 2의 배수인 것들의 값들을 Int형에서 String형으로 변환 후에 ""라는 빈 String에 붙혀주는 작업을 한줄로 끝냇죠. 이렇게 고차함수를 사용하면 여러줄이 됬어야 했을 것들이 한줄로 끝나서 재밋기도 하고 아주 유용하게 쓸 수가 있어요.



그럼.. 오늘은 여기까지..

