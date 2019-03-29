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



//: [Next](@next)
