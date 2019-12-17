## Codable

스위프트 4 버전에서는 스위프트의 인스턴스를 다른 데이터 형태로 변환하고 그 반대의 역할을 수행하는 방법을 제공합니다. 스위프트의 인스턴스를 다른 데이터 형태로 변환할 수 있는 기능을 Encodable 프로토콜로 표현하였고, 그 반대의 역할을 할 수 있는 기능을 Decodable로 표현해 두었습니다. 그 둘을 합한 타입을 Codable로 정의해 두었습니다.

> Swift의 인스턴스를 다른데이터로 변환하는 Encodable과 그 반대기능인 Decodable, 이 둘을 합한게 Codable!


```
typealias Codable = Decodable & Encodable
```

### 인코딩과 디코딩

- `인코딩(Encoding)`은 정보의 형태나 형식을 표준화, 보안, 처리 속도 향상, 저장 공간 절약 등을 위해서 다른 형태나 형식으로 변환하는 처리 혹은 그 처리 방식
- `디코딩(Decoding)`은 인코딩의 반대 작업을 수행하는 것

#### Decodable : Swift 타입의 인스턴스로 `디코딩`할 수 있는 프로토콜

#### Encodable : Swift 타입의 인스턴스를 `인코딩`할 수 있는 프로토콜

### 선언 예제

#### Codable

> `Codable`은 JSON 파일 형식을 Swift로 사용할 수 있도록 해주는 `타입`이다. 사용하기 위해선 JSON 파일의 Key값이 일치해야 사용이 가능하다.

```
struct People: Codable {
    var name: String
    var phoneNumber: String
    var age: Int
    var website: URL?
}
```

#### CodingKey

> 쓰는 이유! ~ > JSON 파일의 key 값이 같아야 Codable를 사용할 수 있는데, 이 key값이 Swift 코딩 스타일과 다를경우... 이를 맞춰주기 위해서 ! 사용합니다 ~_~

```
struct Landmark: Codable {
    var name: String
    var foundingYear: Int
    var location: Coordinate
    var vantagePoints: [Coordinate]
    
    enum CodingKeys: String, CodingKey {
        case name = "title"
        case foundingYear = "founding_date"
        
        case location
        case vantagePoints
    }
}
```

### 사용법

> JSON 파일을 읽을 swift 파일을 하나 선언한 후 Codable과 같이 선언을 하는데, JSON 파일 keyValue값 형식에 맞춰서 작성해 준 다음 다음에 배울 JSON파일을 swift 파일을 통해서 읽어주면 된다.

### Swift 코딩 스타일이란..?

```
1. class, enum 의 이름은 대문자 카멜표기법을 사용한다. 
2. enum의 case이름은 소문자 카멜표기법을 사용한다.
```

#### 참고

- [Codable - Swift Standard Library](https://developer.apple.com/documentation/swift/codable)
- [Encodable - Swift Standard Library](https://developer.apple.com/documentation/swift/encodable)
- [Decodable - Swift Standard Library](https://developer.apple.com/documentation/swift/decodable)
- [CodingKey - Swift Standard Library](https://developer.apple.com/documentation/swift/codingkey)

[돌아가기 > 배우는 내용](https://github.com/kbw2204/swiftNote)