## sort()

컬렉션 정렬 메소드 이다. Element가 Comparable 프로토콜을 준수해야만 사용 할 수 있다. 비슷한 걸로 `sort()와` `sorted()`가 있는데 두 차이점은 아래에서 설명하겠다.

### 사용 방법

```
var students = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
students.sort() // 기본 오름차순
print(students)
// Prints "["Abena", "Akosua", "Kofi", "Kweku", "Peter"]"

// 내림차순 시
students.sort(by: >)
print(students)
// Prints "["Peter", "Kweku", "Kofi", "Akosua", "Abena"]"
```
시간 복잡도는  O(nlog n)

### sorted()랑 차이점은..?
`sort()`는 해당 컬렉션이 실제로 정렬이 되었지만, `sorted()`는 실제로 수정되는 것이 아닌 **정렬된 복제본은 만들어서 리턴**해준다.(그렇기 때문에 메모리 사용량이 두배로..)

#### 참고

- [apple Documentation](https://developer.apple.com/documentation/swift/array/1688499-sort#)

[돌아가기 > 배우는 내용](https://github.com/kbw2204/swiftNote)