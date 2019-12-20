## 제네릭 ##

제네릭(generic)

제레릭은 이렇게 생겼구요.

```
func addItem <T> (a: T, b: T) -> T {
	return a + b
}
```

이상하게 생겼죠?.. 쉽게 말해서 어떤 타입이든 하나를 정할 수 있는 타입변수같은 놈입니다.
제네릭을 사용할려면 제네릭이 필요한 타입 혹은 메소드의 이름 뒤에 기호 <>를 써주면 "이건 제네릭이야" 라고 알려주는거고, <> 사이에  사이에 제네릭 타입 변수명을 사용해주면 됩니다. 꼭 T만 사용해야 하는건 아니고 다른 이름으로도 사용할 수 있어요.

제네릭율 사용하고자 하는 타입 이름 <타입 매.개변수〉
재네릭율 사용하고자 하는 함수 이름〈타입 매개변수〉(함수의 매개변수...)

제네릭에 대해 검색하다 보면 이런글을 많이 보셧을 거에요.

> Generics 는 스위프트의 가장 강력한 기능들 중 하나이며 많은 Swift standard library 가 generic code 로 작성되어 있어요.
> 사실상 여러분은 제네릭을 사용해 오고 있었어요 다만 알지 못했을 뿐이죠.

대부분의 Swift의 standard libraray가 제네릭으로 작성되었다고 합니다. 옵셔널도 제네릭으로 되어 있었죠??

제네릭을 잘 사용하면 중복성을 줄이고 어떠한 타입이라도 유연하게 대응할 수가 있어요. 예를들어서 stack을 구현할 때, stack 안에 들어갈 ㅁrray가 Int형인지 String형인지에 따라 항상 바꿔주거나 중복적으로 선언해 줘야하는 경우가 있는데, 이럴경우 이걸 제네릭으로 만들면 들어오는 타입에 따라 타입을 만들기 때문에 유연하게 대응할 수가 있는거죠!


```
import Foundation

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stack: Stack<Int> = Stack()

stack.push(1)
stack.push(2)
print(stack.pop()) // 2
print(stack.pop()) // 1
```