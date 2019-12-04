## Protocols

#### 프로토콜이란?

**프로토콜은** 컴퓨터와 단말기 사이에서 데이터 통신을 원활하게 하기 위한 필요한 **통신 규약, 약속 입니다.**

그럼 Swift에서의 프로토콜은 어떤걸 의미하는 걸까요?

한번더 필터링을 걸치면 **프로토콜은 특정 작업이나 기능에 적합한 메소드, 프로퍼티 및 기타 요구사항의 청사진을 정의합니다.** 라는 뜻이라는데,

즉 a프로토콜로 메소드나 프로퍼티등을 정의해두고,
구조체, 클래스, 열거형 중 a프로토콜을 채택한다면
a프로토콜에서 요구한 사항들을 꼭 구현해놔! 라는 역할을 하고
결과적으로 a프로토콜을 채택한다면 a프로토콜을 준수하게 되겠네요..
특정 프로토콜(규책, 약속 등)을 따라야 할 때 프로토콜을 사용하겠네요!

### 사용방법은..?

```
//프로토콜 키워드를 사용해서 만들면 됩니다.
protocol 프로토콜이름 {
    // 정의부
}

// 프로토콜 채택
class test: 프로토콜이름 {

}
```

### 프로토콜이 요구 할 수 있는것은..?

```
protocol Talkable{
    // 프로퍼티, 메소드, 이니셜라이저를 요구할 수 있습니다.
    // 이런 프로퍼티는 이런 규칙을 따라야 하고,
    var topic: String { get set } // 읽기 쓰기 가능해야함
    var language: String {get} // 읽기전용만.. 

    // 메소드 요구, 구현은 할 필요 없어요!
    func talk()

    // 이니셜라이저 요구
    init(topic: String, language: String)
}

// 프로토콜 채택 및 준수.. Person구조체는 Talkable 프로토콜을 채택하였습니다..
struct Person: Talkable {
    var topic: String
    let language: String
    
    // 메소드도 구현해야함.. 프로토콜을 채택했으니깐
    func talk() {
        print("talk..")
    }

    // 이니셜라이저도..
    init(topic: String, language: String) {
        self.topic = topic
        self.language = language
    }
}

```

### 프로토콜의 다중상속

프로토콜은 클래스와 다르게 다중상속이 가능합니다.

예를들어서,,
```
protocol Readable {
func read()
}

protocol Writeable {
func write()
}

protocol ReadSpeakable: Readable {
// func read()
func speak() i

protocol ReadWriteSpeakable: Readable, Writeable {
// func read()
// func write() :
func speak()
}
```
이런식으로 꼬리에 꼬리를 무는식으로 상속 받은걸 또 받을 수도 있고 한번에 여러번 받을 수 도 있다.

### is 연산자 -- 추후 추가..

특정 프로토콜을 준수하는지 확인하는 연산자 입니다.
위의 예제로 보면 
```
Person is Talkable // true
Person is Writeable // false
```
가 되겠네요. -- 가 안됨.. 
