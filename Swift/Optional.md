## 옵셔널

옵셔널은 제네릭이 적용된 enum입니다. 옵셔널의 기능은 Swift 특징 중 하나인 안전성을 문법으로 담보하는 기능입니다. 옵셔널은 단어 뜻대로 값이 `있을수도`, `없을수도` 있음을 나타내는 표현입니다. 즉 값이 있으면 값, 없으면 nil을 반환합니다.

### 사용법
```
var name: String? // 옵셔널, 값이 있는지 없는지 모름
name = "kbw"
print(name) // Optional("kbw")
print(name!) // "kbw"
guard let OptionalBindingName = name else {
    return
}
print(OptionalBindingName) // "kbw"
if let ifName = name {
    print(ifName) // "kbw"
}
```

name이라는 변수를 옵셔널로 설정시 값을 초기화 하지 않고 선언을 할 수 있습니다. 왜냐하면 값이 있을수도, 없을수도 있기 때문이죠. 만약 없다면 nil을 알아서 반환해 줄 겁니다.

하지만 옵셔널로 선언했기 때문에 옵셔널 변수를 사용할 땐 이런저런 처리를 해주어야 합니다. 왜냐하면 옵셔널 값은 값이 있을수도, 없을수도 있기 때문이죠. 옵셔널로 처리한 name을 print문 해보면 Optional()이라는 괄호 속에 나오게 됩니다. 하지만 만약 name이란 변수를 메소드의 인자값으로 사용한다면 사용할 수가 없습니다. 왜냐하면 값이 없을 수도 있거든요. 그래서 그 값이 있는지를 확인해주는 guard문을 사용한 옵셔널 바인딩, if let 문을 사용한 암시적 옵셔널 추출을 통해 안정적으로 사용해 주어야 해요. 이렇게 옵셔널을 통해 프로그래밍을 하면 값이 nil이 오는지, 아닌지 직관적으로 확인 할 수 있고 프로그래밍의 오류를 줄일 수 있는 안전한 코딩을 할 수 있게 됩니다.

### 구조
옵셔널은 제너릭이 적용된 열거형 입니다. 추가적으로 ExpressibleByNilLiteral 프로토콜을 따른다고 하네요.. 구조에서 알 수 있듯 옵셔널은 값을 갖고 있는 some 케이스와 값이 없는 none 케이스로 나뉩니다. some의 경우 연관된 값으로 Wrapped에 할당되어 집니다.

```
public enum Optional<Wrapped>: ExpressibleByNilLiteral {
    case none
    case some(Wrapped)
    public init(_ some: Wrapped)
    ...
}
```

#### 참고

- 야곰의 Swift


[돌아가기](https://github.com/kbw2204/swiftNote)