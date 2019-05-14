/*:
 * 함수의 매개변수
     * 내부 매개변수: 함수가 내부적으로 인자값을 참조하기 위해 사용하는 변수
     * 외부 매개변수: 함수 외부에서 함수나 인자값을 구분하기 위해 사용하는 변수
 */
//:---
// 외부 매개변수 예시
func printHello(to name: String, welcomeMessage msg: String) {
    print("Hey \(name), \(msg)")
}   // to, welcomeMessage: 외부 매개변수
    // name, msg: 내부 매개변수
    // 외부 매개변수가 정의되어 있지 않을 때에는 함수를 호출할 때 내부 매개변수를 사용해야 한다
    // 외부 매개변수가 정의되어 있을 때에는 함수를 호출할 때 외부 매개변수를 사용해야 한다

printHello(to: "Jack", welcomeMessage: "Hi")

// 함수 호출 시 매개변수의 생략
func printHello_2 (_ name: String, _ msg: String) {
    print("Hey \(name), \(msg)")
}   // 외부 매개변수 자리에 언더바_
    // '매개변수와 외부 매개변수를 분리하지만 외부 매개변수명을 사용하지는 않겠다'
    // 매개변수가 여러개일 때 일부만 생략하는 것도 가능하다

printHello_2("Jack", "Hi")
//:---
// 가변 인자
func avg (score: Int...) -> Double {
    var total = 0
    for r in score {
        total += r
    }
    return (Double(total) / Double(score.count))
}   // 가변적인 개수의 인자값을 입력받아야 할 때
    // '...' 연산자 사용 <=> 매개변수 score가 가변 인자로 설정된 Int 타입
    // 입력된 인자값을 배열로 처리

print(avg(score: 10, 20, 30, 40))
//:---
// 기본값을 갖는 매개변수
func echo (message: String, newline: Bool = true) {
    if newline == true {
        print(message, true)
    } else {
        print(message, false)
    }
}

echo (message: "Hello") // 매개변수가 기본값을 가지면 생략 가능
echo (message: "Hello", newline: false)
//:---
// 매개변수의 수정
//    func incrementBy(base: Int) -> Int {
//        base += 1
//        return base
//    }
    // error
    // 함수에 입력된 인자값은 함수 내부에서 항상 상수로 정의됨
    // 인자값을 변경할 수 없음

// 상수로 정의되는 함수의 인자값이라 할지라도 내부에서 인자값을 수정하는 방법
    //ex.1
    func incrementBy(base: Int) -> Int {
        var base = base
        base += 1
        return base
    }   // 매개변수와 동일한 이름으로 변수를 정의하고 매개변수의 값을 대입

    //ex.2 - 매개변수가 두 개
    func descAge(name: String, _ paramAge: Int) -> String {
        var name = name
        var paramAge = paramAge
        
        name = name + "'s"
        paramAge += 1
        return "\(name) age is \(paramAge) in next year"
    }
        // 물론 매개변수와 다른 이름의 변수로 선언해도 된다
//:---
// 함수 내부에서 발생하는 사건은 함수 외부에 영향을 미칠 수 없다
var cnt = 30

func autoIncrement(value: Int) -> Int {
    var value = value
    value += 1
    
    return value
}

print(autoIncrement(value: cnt)) // 함수 내부의 value 변수값: 31
print(cnt) // 외부에서 정의된 cnt 변수값: 30

// 함수 내부에서 수정된 인자값이 외부까지 영향을 미칠 수 있는 방법: inout (reference에 의한 전달)
func foo(paramCount: inout Int) -> Int {
    
    paramCount += 1
    return paramCount
}   // inout 키워드가 붙은 매개변수는 인자값으로 사용된 변수와 동일한 객체
    // 함수 내부에서 사용하는 매개변수명이 외부의 변수명과 다를지라도 그렇다
    // 값 자체를 전달하는 것이 아니라 값이 저장된 메모리 주소를 전달

var count = 30
print(foo(paramCount: &count))
    // inout이 사용된 함수는 호출 시 인자값을 전달할 때 값이 아닌 주소를 전달해야 한다
    // 따라서 주소 추출 연산자 '&'를 붙여주어야 한다
print(count)
//:---
/*:
 * 값에 의한 전달
    * 인자값을 전달하면 내부적으로 값의 복사가 이루어져서 복사된 값을 이용하여 구문을 실행
    * 인자값의 수정이 발생하더라도 원본 데이터에는 영향을 미치지 않음
    * func는 inout을 쓰지 않는 이상 값에 의한 전달 방법
 * 참조(Reference)에 의한 전달
    * 내부적으로 복사가 이루어지는 대신 값이 저장된 주소가 전달됨
    * <=> 인자값을 저장하고 있는 객체 자체가 전달됨
    * 함수 내부에서 인자값이 수정되면 그 결과가 외부 인자값 원본에도 반영됨
    * Class로 구현된 인스턴스는 참조에 의한 전달
    * 참조되는 인자의 객체는 오직 변수 (상수, 리터럴 불가능)
 */
//:---
/*:
 * Global 변수
    * 프로그램의 최상위 레벨에서 작성된 변수
    * 프로그램 내 모든 위체에서 참조할 수 있음
    * 프로그램이 종료되기 전까지는 삭제되지 않음
 * Local 변수
    * 특정 범위 내에서만 참조하거나 사용할 수 있음
    * 선언된 블록이 실행되면서 생겨났다가 실행 블록이 끝나면 제거됨
        * <=> __변수의 생명 주기 (life cycle)__
 */
//:---
//변수의 범위와 생명 주기 - 지역 변수
//do { // 상위 블록
//    do { // 하위 블록
//        var ccnt = 3
//        ccnt += 1
//        print(ccnt) // 4
//    }
//
//    ccnt += 1
//    print(ccnt)
//    // 변수의 범위를 벗어났으므로 에러 발생
//}

do {
    var ccnt = 3
    // 상위 블록에서 변수 선언, 초기화
    // 변수가 생성된 블록이 아닌 다른 블록에서 사용하려면 반드시 초기화되어 있어야 함
        // ㄴ하위 블록에서 변수를 사용하는 것은 하나의 블록에서 다른 블록으로 참조에 의한 전달 과정이 일어나는 것
        // ㄴ이를 위해 변수의 주소값이 필요함 (변수의 초기화 <=> 메모리 할당 <=> 변수 주소 존재)
    do {
        ccnt += 1
        print(ccnt)
    }
    ccnt += 1
    print(ccnt)
}

// global 변수
var count_2 = 30

func foo() -> Int {
    count_2 += 1
    return count_2
}
foo()

// local & global
var count_3 = 30 // global

func foo_2(count_3: Int) -> Int {
    var count_3 = count_3 // local
    count_3 += 1
    return count_3
}

print(foo_2(count_3: count_3))
print(count_3)
    // 함수의 외부와 내부에 각각 같은 이름의 변수가 존재하면 내부에서 선언된 변수는 외부와 상관없이 새롭게 생성
    // 블록 내부에서 변수나 상수가 사용될 경우 컴파일러가 이 변수가 정의된 위치를 찾는 순서
        // 함수 등의 블록 내부 범위 -> 함수 등의 블록 외부 범위 -> 글로벌 범위 -> import된 라이브러리 범위
            // 좁은 범위에서 넓은 범위로

