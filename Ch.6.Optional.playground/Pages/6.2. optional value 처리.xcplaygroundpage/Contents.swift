//: [Previous](@previous)
//optional unwrapping
    //옵셔널 타입은 일반형과 서로 연산할 수 없고 옵셔널 타입끼리도 연산 불가
    //따라서 옵셔널 타입의 결과값은 unwrapping 필요
/*:
 * 옵셔널 해제 방법
    * 명시적 해제
        * 1️⃣강제 해제
        * 비강제 해제
    * 묵시적 해제
        * 컴파일러에 의한 자동 해제
        * !연산자를 사용한 자동 해제
 */
//:---
// 1️⃣강제 해제
var optInt: Int? = 3

print("옵셔널 자체의 값 : \(optInt)")
print("!로 강제 해제한 값 : \(optInt!)")
    // !: Forced-Unwrapping Operator

// 옵셔널 값의 안전한 강제 해제
var str = "123"
var intFromStr = Int(str)
print(intFromStr)
if intFromStr != nil {
    print("값이 변환되었습니다. 변환된 값은 \(intFromStr!)입니다")
} else {
    print("값 변환에 실패하였습니다")
}   // 옵셔널 값이 nil이 아닐 때만 강제 해제 연산자를 붙여서 값을 추출해야 한다
    // != 연산자를 사용할 때는 반드시 앞에 공백을 두어야 한다

str = "Swift"
intFromStr = Int(str)
print(intFromStr)
if intFromStr != nil {
    print("값이 변환되었습니다. 변환된 값은 \(intFromStr!)입니다")
} else {
    print("값 변환에 실패하였습니다")
}
//:---
/*:
 * optional binding: 조건문 내에서 일반 상수에 optional value를 대입하는 방식
    * 반드시 조건문에서 사용
    * 상수에 옵셔널 값을 대입한 결과는 true/false로 return
*/
//example
str = "Swift"
if let intFromStr = Int(str) {
    print("값이 반환되었습니다. 반환된 값은 \(intFromStr)입니다")
} else {
    print("값 변환에 실패하였습니다")
}   // intFromStr이 조건문 내에서 상수로 선언됨
    // intFromStr이 옵셔널이 아닌 일반 타입

//example #2
func intStr(str: String) {
    
    guard let intFromStr = Int(str) else {
        print("값 변환에 실패하였습니다")
        return
    }
    
    print("값이 변환되었습니다. 변환된 값은 \(intFromStr)입니다")
}
intStr(str: "Swift")
//: [Next](@next)
