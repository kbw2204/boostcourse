# Swift extension collection

## Contents

- [String](#String-extension)
- [Array](#Array-extension)


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

## Array extension

