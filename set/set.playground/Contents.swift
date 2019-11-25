import Foundation

var setString = Set<String>()
// set이 정의되 있을때의 빈 객체 초기화
setString = []
// 값이 있는상태에서의 초기화
setString = Set(["a", "b", "c", "d"])
// 순서 x
print(setString)
// insrt
setString.insert("e")
// 중복값 x
setString.insert("a")

// remove, 값을 리턴함
print(setString.remove("e"))
// 없는값이라면 nil 반환
print(setString.remove("e"))
// contains
print(setString.contains("b"))
//count, isEmpty
print(setString.isEmpty) // true
print(setString.count) // 4
// for 문 사용 가능
for c in setString {
    print(c) // bcad(순서x)
}
// setString = a,b,c,d
var a: Set = ["안녕하세요", "b", "c","배고파요"]
// 교집합
print(setString.intersection(a)) // ["b", "c"]
// 합집합
print(setString.union(a)) // ["a", "안녕하세요", "c", "배고파요", "b", "d"]
// 합집합 - 교집합
print(setString.symmetricDifference(a)) // ["a", "배고파요", "안녕하세요", "d"]
// 여집합
print(setString.subtracting(a)) // ["d", "a"]

// 검색
print(a.filter{ $0.hasPrefix("안녕")}) // ["안녕하세요"]
print(a.filter{ $0.hasPrefix("하세")}) // []

let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
let attendees: Set = ["Alicia", "Bethany", "Diana"]
let alone: Set = ["Dofu"]
//{}가 of 안에 있을때
attendees.isSubset(of: employees) // true
// of 가 {}.의 안에 있을때
employees.isSuperset(of: attendees) // true
// 공통 값 없을때
alone.isDisjoint(with: employees) // true
