## stack

### 스택이란..?

한 쪽 끝에서만 자료를 넣고 뺄 수 있는 LIFO(Last In First Out) 형식의 자료 구조이다.
> 쉽게 물건을 쌓아 올리고 가져갈 땐 맨 위에꺼를 가져간다고 생각하면 쉽다.

### 스택의 필수 구현 method들
- `pop() -> T`: 스택의 가장 위 값을 제거 하면서 값 return
- `push(val: T)`: 값 하나를 스택 가장 윗부분에 추가
- `top() -> T`: 가장 윗부분 값 return
- `isEmpty() -> Bool`: 스택이 비어있으면 true

### 스택의 사용 사례

- 재귀 알고리즘
- 방문 기록(뒤로가기, 앞으로가기)
- 실행 취소(undo)
- 역순 문자열 만들기
- 괄호 연산
- 후위식 표기법 변환, 계산

### 구현 방법

스택은 대부분 class로 stack을 정의 해둔 뒤에 객체를 선언하여 사용합니다.

```
class Stack {
    var stack: [String] = []
    
    func push(_ val: String) {
        stack.append(val)
    }

    func pop() -> String {
        return stack.isEmpty ? "-1" : stack.removeLast()
    }

    func size() -> Int {
        return stack.count
    }

    func empty() -> Bool {
        return stack.isEmpty ? true : false
    }

    func top() -> String {
        guard let val: String = stack.last else {
            return "-1"
        }
        return val
    }
}
...
var stack: Stack()
```

### stack과 queue의 차이

스택은 LIFO(last in first out)이고, queue는 FIFO(First In Fisrt Out)이란 점에서 사용 용도에서 차이가 있다.

### 참고

- [heejeong Kwon Blog](https://gmlwjd9405.github.io/2018/08/03/data-structure-stack.html)

[돌아가기](https://github.com/kbw2204/swiftNote/blob/master/cs/cs50.md)