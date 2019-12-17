## JSONDecoder / JSONEncoder

> JSON 파일을 Swift에서 읽고 쓸 수 있게 하는 것, Swift 4부터 JSONDecoder가 Codable 프로토콜을 지원하기 때문에, 이를 이용해서 JSON 형식으로 인코딩 및 디코딩을 할 수 있다.

### JSONEncoder 예제

Codable 프로토콜을 준수하는 GroceryProduct 구조체의 인스턴스를 JSON 데이터로 인코딩하는 방법.

```
struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String?
}

let pear = GroceryProduct(name: "Pear", points: 250, description: "A ripe pear.")

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

do {
	let data = try encoder.encode(pear)
	print(String(data: data, encoding: .utf8)!)
} catch {
	print(error)
}

// ----- 출력
 {
   "name" : "Pear",
   "points" : 250,
   "description" : "A ripe pear."
 }

// Tip : encoder.outputFormatting = .prettyPrinted 설정하면 들여쓰기를 통해 가독성이 좋게 출력해줍니다.
```

### JSONDecoder 예제

JSON 데이터를 Codable 프로토콜을 준수하는 GroceryProduct 구조체의 인스턴스로 디코딩하는 방법입니다.

```
struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String?
}

/// 스위프트 4 버전부터 """를 통해 여러 줄 문자열을 사용할 수 있습니다.
let json = """
{
    "name": "Durian",
    "points": 600,
    "description": "A fruit with a distinctive scent."
}
""".data(using: .utf8)!

let decoder = JSONDecoder()

do {
	let product = try decoder.decode(GroceryProduct.self, from: json)
	print(product.name)
} catch {
	print(error)
}
// ----- 출력 
"Durian"

// 출처 : edwith
```

#### 참고

- [JSONEncoder - Foundation](https://developer.apple.com/documentation/foundation/jsonencoder)
- [JSONDecoder - Foundation](https://developer.apple.com/documentation/foundation/jsondecoder)

[돌아가기 > 배우는 내용](https://github.com/kbw2204/swiftNote)