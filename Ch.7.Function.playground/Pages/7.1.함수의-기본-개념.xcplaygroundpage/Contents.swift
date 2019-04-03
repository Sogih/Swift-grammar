//: [Previous](@previous)
/*:
 ## 사용자 정의 함수의 기본형식
```
 func 함수이름(매개변수1: 타입, 매개변수2: 타입, ...) -> 반환타입 {
   실행내용
   return 반환값
 }
 ```
 * 함수이름
    * 첫 글자는 반드시 영어 또는 언더바로 시작해야 한다
 * 매개변수
    * 괄호를 비워둠으로써 생략가능하다
 * 반환타입
    * 어떤 자료형이라도 가능하다
    * 반환타입이 지정되면 그 타입에 맞는 값을 반환해야 한다
    * nil을 반환하려면 optional type으로 정의되어야 한다
    * 반환값이 없는경우 생략가능하다
 */
//:---
//example #1 - 매개변수와 반환값이 모두 없는 함수
func printHello() {
    print("Hello")
}

//example #2 - 매개변수가 없지만 반환값은 있는 함수
func sayHello() -> String {
    let returnValue = "Hello"
    return returnValue
}

//example #3 - 매개변수는 있으나 반환값이 없는 함수
func printHelloWithName(name: String) { //name: 인자 레이블 (매개변수명)
    print("Hello, \(name)")
}

//example #4 - 매개변수와 반환값이 모두 있는 함수
func sayHelloWithName(name: String) -> String {
    let returnValue = "Hello, \(name)"
    return returnValue
}

//반환값이 없는 함수일 경우에도 return을 쓰는 경우
    //ㄴ이때 retrun은 함수의 실행을 명시적으로 종료할 목적으로 사용됨
func hello(name: String?) {
    guard let _name = name else {
        return
    }
    
    print("Hello, \(name)")
}
//:---
//함수의 호출
    //ex.#1
    printHello()

    //ex.#3
    printHelloWithName(name: "Gihyeon")
        //인자 레이블(매개변수명)을 빼먹지 않도록 주의하자
//:---
//: * 함수는 반드시 하나의 값만을 반환해야 한다
//: * 여러 개의 값을 반환해야 한다면, 이 값들을 집단 자료형에 담아 반환해야 한다
// 튜플을 반환하는 함수에 대한 선언
func getUserInfo() -> (Int, String, Character) {
    let height = 175
    let name = "Gihyeon"
    let gender: Character = "M"
    
    return (height, name, gender)
}

var uInfo = getUserInfo() // 함수 호출
uInfo.0
uInfo.1
uInfo.2
var (a, b, c) = getUserInfo() // 튜플 요소 각각을 변수로 직접 받기
a
b
c
var (height, _, name) = getUserInfo() // 필요 없는 튜플 항목에 대해 변수 할당 받지 않기
height
name

// 실행 결과로 반환되는 튜플의 각 아이템을 함수 정의 구문을 통해 변수에 미리 할당
func getUserInfo_2() -> (h: Int, g: Character, n: String) {
    let gender: Character = "M"
    let height = 175
    let name = "Gihyeon"
    
    return(height, gender, name)
}
var result = getUserInfo_2()
result.h
result.g
result.n

// 타입 알리어스
    // ㄴ특정 튜플 타입이 여러 곳에서 사용될 경우
    // ㄴ이름이 길거나 사용하기 복잡한 타입 표현을 새로운 타입명으로 정의해주는 문법
typealias infoResult = (Int, Character, String)

func getUserInfo_3() -> infoResult {
    let gender: Character = "M"
    let height = 175
    let name = "Gihyeon"
    
    return (height, gender, name)
}

let info = getUserInfo_3()
info.0
info.1
info.2

//type alias를 이용하여 축약 표현을 만들 때 변수가 바인딩된 튜플을 정의
typealias infoResult_2 = (h: Int, g: Character, n: String)

func getUserInfo_4() -> infoResult_2 {
    let gender: Character = "M"
    let height = 175
    let name = "Gihyeon"
    
    return (height, gender, name)
}

let info_2 = getUserInfo_4()
info_2.0
info_2.1
info_2.2

