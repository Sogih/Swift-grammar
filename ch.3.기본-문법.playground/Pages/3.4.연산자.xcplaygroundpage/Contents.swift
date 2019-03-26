//: [Previous](@previous)

//:---
//논리연산자 !:'not', &&: 'and', ||: 'or'
!true
!false

true && true
false && false
true && false

true || true
false || false
true || false
//:---
//range operator:
print(1 ... 5) //1,2,3,4,5 _ closed range opertor
print(1 ..< 5) //1,2,3,4 _ half-closed range operator
//1 >.. 5 처럼 반대 방향으로 사용 불가능

let a = 1
let b = 5

for row in a...b{
    row
}

for row in a..<b{
    row
}
//:---

//: [Next](@next)
