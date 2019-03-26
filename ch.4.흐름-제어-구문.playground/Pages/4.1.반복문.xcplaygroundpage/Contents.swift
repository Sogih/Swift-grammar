//: [Previous](@previous)
/*:
 * 반복문
    * for문: 횟수에 의한 반복
    * while문: 조건에 의한 반복
        * while 구문: 시작할 때 조건식을 평가
        * repeat~while 구문: 완료할 때 조건식을 평가
 */
//:---
//for문
for row in 1...5 {
    print(row)
}

//for문 구구단 2단
for row in 1...9 {
    print("2 x \(row) = \(2*row)")
}

//for문 연도
for year in 1992...2019 {
    print("\(year) 년도")
}

//for문을 이용하여 문자열의 문자를 순회
var lang = "swift"
for char in lang.characters {
    print("개별 문자는 \(char)입니다")
}

//for문 루프 상수의 생략
let size = 5
let padChar = "0"
var keyword = "3"
for _ in 1...size {
    keyword = padChar + keyword
    //매 실행마다 왼쪽에 0이 추가, 문자열의 덧셈 연산은 이어붙이기
}
print("\(keyword)")

//for문 이중루프를 활용한 구구단 출력
for i in 2...9 {
    for j in 1...9{
        print("\(i) x \(j) = \(i*j)")
    }
}
//:---
//while
var n = 2
while n < 1000 { //조건문
    n = n * 2
    //조건문 참일 때 수행하는 반복문
}
print("n = \(n)")

//repeat~while
var k = 1024
repeat{
    k * 2
}//일단 한번은 실행
while k < 1000
 //조건문 거짓이면 루프 아웃
print("n = \(n)")

//: [Next](@next)
