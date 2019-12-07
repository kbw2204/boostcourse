## queue

### 큐란..?

큐는 일상에서 흔히 볼 수 있는 자료 구조의 한가지로, FIFO(First-In-First-Out) 구조로 저장하는 자료구조를 말한다.
> 놀이기구 줄 설 때를 생각하면 된다. 먼저 온 사람이 먼저 탄다..

### 스택의 필수 구현 method들

- `push(val: T)`: 값을 맨 뒤에 추가해 줍니다.
- `pop -> T`: 맨 앞의 값을 제거와 동시에 리턴합니다.
- `size -> Int`: 큐의 사이즈를 리턴합니다.
- `empty -> Bool`: 큐가 비어있으면 true를 리턴합니다.
- `front -> T`: 큐의 맨 앞 값을 리턴합니다.
- `back -> T`: 큐의 맨 뒷 값을 리턴합니다.

### 스택의 사용 사례

- 대기열 순서
- 너비 우선 탐색(BFS, Breadth-First Search) 구현
  - 처리해야 할 노드의 리스트를 저장하는 용도로 큐(Queue)를 사용한다.
  - 노드를 하나 처리할 때마다 해당 노드와 인접한 노드들을 큐에 다시 저장한다.
  - 노드를 접근한 순서대로 처리할 수 있다.
- 콜센터 대기시간
- 프린터의 처리시간
- 프로세스 관리

### 구현 방법

큐는 대부분 class로 Queue를 정의 해둔 뒤에 객체를 선언하여 사용합니다.
```
class Queue {
    var queue: [Int] = []
    
    func push(val: Int) {
        queue.append(val)
    }

    func pop() -> Int {
        return queue.isEmpty ? -1 : queue.removeFirst()
    }

    func size() -> Int {
        return queue.count
    }

    func empty() -> Int {
        return queue.isEmpty ? 1 : 0
    }

    func front() -> Int {
        guard let firstValue: Int = queue.first else {
            return -1
        }
        return firstValue
    }

    func back() -> Int {
        guard let lastValue: Int = queue.last else {
            return -1
        }
        return lastValue
    }
}
...
var queue = Queue()
```
> NOTE: 큐(Queue)에서 처음과 마지막 노드를 갱신할 때 실수할 수 있으니 재확인!

### 참고

- [heejeong Kwon Blog](https://gmlwjd9405.github.io/2018/08/02/data-structure-queue.html)

[돌아가기](https://github.com/kbw2204/swiftNote/blob/master/cs/cs50.md)