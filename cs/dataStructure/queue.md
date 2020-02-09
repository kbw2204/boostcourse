## Queue ##

### Queue란? ###

큐는 기본적인 자료구조 중 하나로 FIFO(First-In, First-Out) 순서를 사용합니다. FIFO는 쉽게 말해서 먼저 들어온 놈이 먼저 나가는 구조입니다.
> 그래서 큐에선 중간은 중요하지 않아요.


### Queue를 구현하는 방법 ###

큐를 구현하는 방법은 많겠지만 일반적으로 2가지 방법으로 큐를 구현할 수 있어요.

1. 그냥 큐를 구현하기

2. 2개의 Stack를 사용해서 큐를 구현하기

두번째 방법에서 "왜 굳이 2개의 스택을 사용해서 큐를 구현하지?" 라 생각이 들 수도 있어요. 저도 그랬거든요. 하지만 2개의 스택을 사용해서 큐를 구현하면 이점이 있는데 이는 구현단계에서 설명해 드릴게요.

### Queue by Swift ###

우선 Queue에 대한 규칙을 정해줄 거에요. protocol를 사용해서 규칙을 만들어 줄 수 있어요.

```swift
protocol Queue {
  associatedtype Element
  
  mutating func enqueue(_ element: Element)
  mutating func dequeue() -> Element?
  var isEmpty: Bool { get }
  var peek: Element? { get }
}
```



Queue에는 적어도 4가지 기능이 있어야 해요.

- enqueue(): 값을 넣을 수 있는 메소드가 있어야 하고
- dequeue():  값을 꺼낼 수 있는 메소드가 있어야 하고
- peek 프로퍼티를 통해 다음으로 나올 값을 알 수 있어야 하고
- isEmpty 프로퍼티를 통해 큐가 비어있는지 알 수 있어야 합니다.

이러한 규직을 만들어서 지켜주세요! 라고 하는게 protocol의 기능이에요.

func 옆에 mutating을 적어준 이유는 Queue를 struct로 구현할 것이기 때문에, 구조체나 열거형 등은 값 타입이기 때문에 이러한 타입의 값을 수정할 때에는 앞에 mutating을 추가해 줘야 해요. 참조 타입인 class의 경우에는 작성할 필요가 없어요.


Queue의 프로토콜을(규칙) 정의해줬으니 이제 큐를 구현해 보겠습니다.

```swift
struct QueueArray<T>: Queue {
  private var array: [T] = []
  var isEmpty: Bool {
    return array.isEmpty
  }
  var peek: T? {
    return array.first
  }
  
  mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  @discardableResult
  mutating func dequeue() -> T? {
    return isEmpty ? nil : array.removeFirst()
  }
}
```



QueueArray 옆에 <T>는 제네릭이란 녀석이에요. 쉽게말해서 타입 변수라고 생각하시면 됩니다. 제네릭으로 선언함으로써 어떤 타입이든 재정의 없이 사용할 수가 있어요.
> 그렇다고 한 Queue에 여러 타입이 들어갈 수 있다는게 아니라, 예를들어서 Int형을 사용했다면.. Int형만 들어갈 수 있어요.  Int형 Queue, String형 Queue를 각각 선언할 필요 없이 <T>라는 제네릭을 사용함으로써 모든 타입을 다 사용할 수 있다는 얘기엿습니다.. 제네릭을 사용 안했다면 Int형, String형 등등 사용할 타입별로 다 선언해 줘야 사용가능해요.



### 2개의 스택으로 Queue를 구현하는 방법 ###

위와 같은 방법으로 큐를 간단히 구현할 수 있지만 다른 방법으로도 큐를 구현할 수 있어요. 바로 2개의 Stack를 사용하는 거죠.

### Logic

스택은 LIFO(Last-In, First-Out) 구조로 값을 쌓아 올리고, 뺄때는 맨 위에있는 놈을 가져가는, 가장 마지막으로 들어온 놈이 가장 빨리나가는 구조에요. 이러한 스택 하나를 enqueue로 사용하여 값을 넣어주고, 값을 뺄 경우엔 enqueue 스택에 있는 array를 뒤집어서 dequeue에 넣고 스택의 구조로 pop을 해주면

결국 FIFO와 같은 큐의 구조를 가지게 되요.

2개의 스택을 사용해서 만든 Queue를 QueueStack이라고 네이밍 해보면 QueueStack 또한 Queue의 프로토콜을 그대로 가져갑니다.
> QueueStack 또한 Queue의 특징인 enqueue와 dequeue가 있어야 하고 isEmpty, peek이 있어야 하기 때문이죠



```swift
struct QueueStack<T>: Queue {
  private var dequeueStack: [T] = []
  private var enqueueStack: [T] = []
  
  var isEmpty: Bool {
    return dequeueStack.isEmpty && enqueueStack.isEmpty
  }
  var peek: T? {
    return !dequeueStack.isEmpty ? dequeueStack.last : enqueueStack.first
  }
  
  mutating func enqueue(_ element: T) {
    enqueueStack.append(element)
  }
  
  @discardableResult
  mutating func dequeue() -> T? {
    if dequeueStack.isEmpty {
      dequeueStack = enqueueStack.reversed()
      enqueueStack.removeAll()
    }
    return dequeueStack.popLast()
  }
}
```



enqueue까지는 똑같습니다.  하지만 값을 빼는 dequeue와 peek에서 차이가 있는데요. 값을 빼는 과정에서 enqueue를 뒤집어서 dequeue에 넣어서 pop(맨 위의 값을 빼는)을 하는 과정이 필요하기 때문에 만약 dequeue 안에 값이 없다면 enqueue의 값들을 뒤집어서 dequeue에 넣어주고, 그게 아니라면 dequeue의 값을 pop해주면 됩니다.




### 더블스택큐의 장점 ###

얼핏보면 왜 이렇게 복잡하게 queue를 구현해야 하나 싶을텐데, 이렇게 2개의 Stack으로 Queue를 구현함으로써 얻는 이점은 다음과 같습니다.

값을 넣는 enqueue 과정에선 그냥 큐로 구현하나 더블스택으로 구현하나 시간 복잡도는 O(1) 입니다.
**하지만** 값을 빼는 dequeue의 과정에선 일반 queue와 같은 경우엔 **가장 첫번째 값을 제거하면 인덱스 0번째 값이 사라지는 작업이기 때문에** **다른 모든 요소들이 바뀌어야** 합니다. 즉 **모든 다른 요소들을 shift 해주는 작업**이 동반됨으로(n번) **시간복잡도는 O(n)**으로 **비효율적**입니다.
반면에 **더블스택**을 사용하면 가장 **마지막 인덱스값을 pop** 하여 꺼내주기 때문에 시간복잡도는 **O(1)로 효율적**입니다.
공간복잡도는 일반 큐와 더블스택 둘다 동일하게 O(n) 입니다.

즉 더블스택을 사용한 Queue 구현은 복잡하긴 하지만 dequeue 과정에서 시간복잡도를 개선할 수 있기에 더 효율적인 구현 방법입니다.

### 요약 ###

Queue는 FIFO 구조를 가지고 있고, 구현방법은 일반 큐 구현과 2개의 스택을 사용한 큐 구현방법이 있습니다.

### 시간 복잡도

|             | 일반 큐 | 더블스택 큐 |
| :---------: | :-----: | :---------: |
|  enqueue()  |  O(1)   |    O(1)     |
|  dequeue()  |  O(n)   |    O(1)     |
| 공간 복잡도 |  O(n)   |    O(n)     |

