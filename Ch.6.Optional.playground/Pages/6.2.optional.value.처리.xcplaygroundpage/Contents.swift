//: [Previous](@previous)
//optional unwrapping
    //옵셔널 타입은 일반형과 서로 연산할 수 없고 옵셔널 타입끼리도 연산 불가
    //따라서 옵셔널 타입의 결과값은 unwrapping 필요
/*:
 * 옵셔널 해제 방법
    * 명시적 해제
        * 1️⃣강제 해제
        * 2️⃣비강제 해제
    * 묵시적 해제
        * 3️⃣컴파일러에 의한 자동 해제
        * 4️⃣!연산자를 사용한 자동 해제
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
//optional binding- example- 2️⃣비강제 해제
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
intStr(str: "123")
intStr(str: "Swift")

//example #3
var capital = ["KR":"Seoul", "EN":"London", "FR":"Paris"]

print(capital["KR"])
    //기본적으로 dictionary에 key로 접근하면 optional type으로 return
    //딕셔너리에서 값을 읽을 때에는 존재하지 않는 키를 사용할 가능성이 있기 때문이다
    //정해진 정수형 숫자 0,1,2,...가 아닌 어떤 타입의 제한이 없기 때문이다
    //따라서 접근하려는 어떤 키가 비어있거나 없는 경우가 발생할 수 있으므로
print(capital["KR"]!)
    //nil 여부를 체크하지 않고 ! 연산자를 사용하여 바로 강제 해제

//example #4- dicitionary를 언래핑할 때 nil 여부를 확인하는 절차를 거치는 방법
if (capital["KR"] != nil) {
    print(capital["KR"]!)
}
    //또는
if let val = capital["KR"] {
    print(val)
}
//:---
//3️⃣컴파일러에 의한 옵셔널 자동해제 #1
let optInt_2 = Int("123")
    optInt_2 == 123
    optInt_2 == Optional(123)
    optInt_2! == 123
    optInt_2! == Optional(123)
        // 한쪽이 옵셔널, 한쪽이 일반 타입인 경우의 비교 연산일 경우
        // 자동으로 옵셔널 타입을 해제하여 비교 연산을 수행한다
        // 따라서 다음과 같은 방법이 가능하다

if ((optInt_2!) == 123) {
    print("optInt_2 == 123")
} else {
    print("opInt_2 != 123")
}   //즉, 비교 연산을 처리할 때는 옵셔널 타입 여부에 구애받지 않고 일반 자료형처럼 값을 비교하면 된다

    //옵셔널 값의 할당
        var optValue01 = Optional(123)
        //옵셔널 타입의 변수나 상수를 정의할 때는 대입할 값을 optional() 객체로 감싼형태로 처리해야한다
        var optValue02 : Int? = 123
        print(optValue02)
        //그러나 ㄴ처럼 감싸지지 않은 순수 리터럴을 직접 대입할 수도 있다.
        //?를 추가하여 int 타이면서 동시에 옵셔널 타입이라는 것을 명시한 것이다
        var optValue03 : Int = 123
        print(optValue03)
        //?가 빠져버리면 그냥 일반 Int 타입으로 인식해 버린다
//:---
/*:
 * 4️⃣.옵셔널의 묵시적해제- !연산자 자동해제
    * 옵셔널 타입이긴 하지만 값을 사용할 때에는 자동으로 옵셔널이 해제
    * 옵셔널 변수를 사용하는 모든 경우에 적용 가능
    * 옵셔널 변수의 타입을 선언할 때 묵시적 해제를 미리 선언
    * 형식상 옵셔널로 정의해야 하지만, 실제로 사용할 때에는 저대 nil 값이 대입될 가능성이 없는 변수일 때
 */
// 명시적 옵셔널 선언
var str_2: String? = "Hey!"
print(str_2)
    //오류: print(str_2+" what's up?")

// 묵시적 옵셔널 선언- 옵셔널, 일반형 알아서 바까줌 (Implicitly Unwrapped Optionals)
var str_3: String! = "Hey!"
print(str_3)
print(str_3 + "What's up?")
    //컴파일러에 의해 옵셔널 객체가 자동으로 해제됨
str_3 = nil
    //이럴땐 또 옵셔널로 인식해서 nil도 대입됨

var value01: Int? = 10  //명시적 옵셔널 선언
    //오류: value01 + 5
var value02: Int! = 10  //묵시적 옵셔널 선언
    value02 + 5 //오류x

var value: Int! = Int("123")
//: [Next](@next)
