# Swift extension collection

## Contents

- [String](#String-extension)
- [Array](#Array-extension)

## 알고쓰자(추후이동)

### String

- String for 문
~~~
let str: String = "abcdf"
for c in str {
    print(c)
}
//a
//b
//c
//d
//f
~~~

- String 기준점 나누기
~~~
let str: String = "1234567"

let dividePoint: String.Index = str.index(str.startIndex, offsetBy: 3)
let before: String = String(str[..<dividePoint]) // String으로 변환 안하면 SubString상태
let after: String = String(str[dividePoint...])
print("before: \(before) / after: \(after)")
//before: 123 / after: 4567
~~~

## String extension

### String 범위 출력
~~~
extension String {
    subscript(r: Range<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: r.lowerBound)
        let end = self.index(self.startIndex, offsetBy:  r.upperBound)
        
        return String(self[start..<end])
    }
}

let str = "iOS Developer"

print(str[0..<3])   // iOS
print(str[4..<str.count]) // Developer
~~~

### String 해당범위 나누기 -> Array
~~~
extension String {
    func split(at index: Int) -> [String] {
        let pivot = self.index(self.startIndex, offsetBy: index)
        let u = self.prefix(upTo: pivot)
        let v = self.suffix(from: pivot)
        
        return [String(u), String(v)]
    }
}

let str: String = "123456"
var arr: [String] = str.split(at: 3)
//["123", "456"]
~~~

## Array extension

