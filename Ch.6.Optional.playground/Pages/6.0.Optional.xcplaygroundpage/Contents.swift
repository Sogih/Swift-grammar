//: [Previous](@previous)

/*:
 * Optional
    * nil을 사용할 수 있는 타입과 사용할 수 없는 타입을 구분
    * optional type: nil을 사용할 수 있는 타입
    * 일반 자료형은 nil 값을 가질 수 없다
    * optional wrapping: 정상적으로 반환된(nil이아닌) 값이 optional type으로 둘러싸여 있는 것
    * 이 경우 optional unwrapping을 통해 실제 값을 추출하여 사용해야함
 */

let capital = ["KR": "Seoul", "CN": "Beijing", "JP": "Tokyo"]
capital["ko"]

Int("Swift")
    //문자열을 정수형으로 변환하려고 할 때 컴파일 에러를 발생하는 대신 nil을 반환함
    //컴파일 에러를 최소화 하기 위함

let v = Int("123")
print(v!) //optional unwrapping
//: [Next](@next)
