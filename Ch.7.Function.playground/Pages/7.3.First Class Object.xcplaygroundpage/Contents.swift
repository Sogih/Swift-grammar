/*:
 * 일급 객체로 간주하는 조건
    * 객체가 런타임에도 생성이 가능해야 한다
    * 인자값으로 객체를 전달할 수 있어야 한다
    * 반환값으로 객체를 사용할 수 있어야 한다
    * 변수나 데이터 구조 안에 저장할 수 있어야 한다
    * 할당에 사용된 이름과 관계없이 고유한 구별이 가능해야 한다
 * 함수가 이런 조건을 만족하면 이를 First-Class Function(일급 함수)라고 한다
 */
//:---
//feature of first-class function - 1️⃣ 변수나 상수에 함수를 대입할 수 있음
    // ㄴ함수 자체를 변수에 할당하면 변수도 함수처럼 인자값을 받아 실행이 가능하고, 값을 반할 수 있음
func foo(base: Int) -> String {
    print("The function foo is executed")
    return "The result is \(base + 1)"
}
let fn1 = foo(base: 5)
    //이것은 상수에 함수를 대입한 것이 아니라 함수의 결과값을 상수에 할당하는 단순 대입 연산에 지나지 않다
    //결과값을 할당하기 위해 함수를 한 번 실행한다
let fn2 = foo
    //상수에 함수가 할당됨
    //fn2는 foo 와 같은 인자값, 같은 기능, 같은 반환값을 가지는 함수가됨
    //변수나 상수에 함수를 대입할 때에는 함수가 실행되는 것이 아니라 함수라는 객체 자체만 대입됨
    //fn2는 일반적인 자료형과는 전혀 다른 type인 function types(함수 타입)이 된다.
        //ㄴ함수 타입은 반환값이 없는 함수일 경우에 'Void'라고 명시해 주어야 함

func boo(age: Int) -> String {
    return "\(age)"
}

    //함수 boo의 함수타입 형태: (Int) -> String
    //인자타입과 반환타입만 써주면 된다
let fn: (Int) -> String = boo
    //함수 타입을 상수에 할당

    //두 개의 인자값을 받는 함수의 타입
    func boo_2(age: Int, name: String) -> String {
        return "\(name)'s age is \(age)"
    }
        //boo_2 함수의 함수타입: (Int, String) -> String
    let s: (Int, String) -> String = boo_2
        //boo_2 함수 타입을 상수 s에 할당
        //함수 식별자를 쓴 구문으로도 가능
            // let s: (Int, String) -> String = boo_2(age:name:)
                //boo_2: 함수의 이름
                //boo_2(age:name:): 함수의 식별자
        //함수 식별자와 함수 이름을 구분하는 이유
        func boo_3(age: Int) -> String {
            return "\(age)"
        }
        func boo_3(age: Int, name: String) -> String {
            return "\(name)'s age is \(age)"
        }
            //let t = boo_3 (x)
            //두 함수의 이름은 boo_3이지만 매개변수 차이 때문에 서로 다른 식별값을 가짐
            //이러한 경우에 두 함수를 구분하기 위해 식별자를 사용해야함
        let t1: (Int, String) -> String = boo_3 // 타입 어노테이션을 통해 입력받을 함수의 타입을 지정
        let t2 = boo_3(age:name:) // 함수의 식별값을 통해 입력받을 정확한 함수를 지정

        //타입 어노테이션과 함수 이름의 조합으로 대입 구문을 구성하면 안되는 경우
            //ㄴ동일한 함수 타입을 사용하지만 매개변수명이 서로 다른 함수의 경우
        func boo_4(age: Int, name: String) -> String {
            return "\(name)'s age is \(age)"
        }
        func boo_4(height: Int, nick: String) -> String {
            return "\(nick)'s height is \(height)"
        }
        //let fn03: (Int, String) -> String = boo_4 (x)
        //let fn04: (Int, String) -> String = boo_4 (x)...특정 불가
        let fn03: (Int, String) -> String = boo_4(age:name:) //(o)
        let fn04: (Int, String) -> String = boo_4(height:nick:) //(o)
            //식별자를 이용하는 경우 정확한 함수 지정이 가능하므로 타입 어노테이션 생략 가능
            //ㄴlet fn03 = boo_4(age:name:)
            //ㄴlet fn04 = boo_4(height:nick:)

    //tuple을 반환하는 함수 타입
    func foo_2(age: Int, name: String) -> (String, Int) {
        return (name, age)
    }
        //함수타입: (Int, String) -> (String, Int)

    //인자값이 없는 함수의 함수 타입
    func foo_3() -> String {
        return "Empty Values"
    }   // 함수타입 () -> String

    //반환값이 없는 함수의 함수 타입
    func foo_3(base: Int) {
        print("param = \(base)")
    }   // 함수타입 (Int) -> () or (Int) -> Void

    //인자값, 반환값 모두 없는 함수의 함수 타입
    func too() {
        print("Empty values")
    }   // 함수타입 () -> () or () -> Void
            // void는 반환값에만 사용 가능
//:---
//feature of first-class function - 2️⃣함수의 반환 타입으로 함수를 사용할 수 있음
    //ㄴ일급 객체 함수는 클래스, 구조체, 함수 자체를 반환할 수도 있음
func desc() -> String {
    return "this is desc()"
}

func pass() -> () -> String {
    return desc
}   // desc 함수 자체를 반환
    // pass 함수의 반환 타입: () -> String
    // () -> String: 함수타입으로 표현한 desc 함수
    // 첫번째 '->' 기준으로 왼쪽이 pass의 인자 타입, 오른쪽이 반환 타입
    // 두번째 '->' 기준으로 왼쪽이 desc의 인자 타입, 오른쪽이 반환 타입

let p = pass()
    //pass 함수의 실행 결과값 할당
    //pass 함수의 반환값은 desc함수
    //<=> p에 desc 함수 할당
desc()
p()

//ex
func plus(a: Int, b: Int) -> Int {
    return a + b
}

func minus(a: Int, b: Int) -> Int {
    return a - b
}

func times(a: Int, b: Int) -> Int {
    return a * b
}

func divide(a: Int, b: Int) -> Int {
    guard b != 0 else {
        return 0
    }
    return a / b
}

func calc(_ operand: String) -> (Int, Int) -> Int {
    //외부 매개변수 _: 함수 호출 시 인자 레이블 생략 가능
    switch operand {
    case "+" :
        return plus
    case "-" :
        return minus
    case "*" :
        return times
    case "/" :
        return divide
    default :
        return plus
    }
}

let c = calc("+")
c(3,4)
    //<=> calc("+")(3,4)

let c2 = calc("-")
c2(3,4)

let c3 = calc("*")
c3(3,4)

let c4 = calc("/")
c4(3,4)
//:---
//feature of first-class function - 3️⃣함수의 인자값으로 함수를 사용할 수 있음
func incr(param: Int) -> Int {
    return param + 1
}   // 인자값으로 사용될 함수

func broker(base: Int, function fn: (Int) -> Int) -> Int {
    return fn(base)
}   // 두번째 매개변수는 인자로 "인자값으로 Int를 받고 반환값으로 Int를 주는 함수"를 받는다
    // 타입만 일치한다면 인자로 받는 함수는 어떤 함수라도 가능하다
    // 이처럼 중개 역할을 하는 함수를 broker(브로커)라고 한다

broker(base: 3, function: incr)

// call back function
    //ㄴ특정 구문의 실행이 끝나면 시스템이 호출하도록 처리된 함수
func successThrough() {
    print("Operation processing succeeded")
}

func failThrough() {
    print("Operation processing failed")
}

func divide_2(base: Int, success sCallBack: () -> Void, fail fCallBack: () -> Void) -> Int {
    //sCallback, fcCallBack: '() -> void' 함수 타입을 받는 매개변수
    guard base != 0 else {
        fCallBack()
        //<=> fCallBack 매개변수에 대입된 함수를 실행
        return 0
    }   // base가 0이면 fCallBack() 실행 -> 0 반환 -> 종료
    
    defer {
        sCallBack()
        //<=> sCallBack 매개변수에 대입된 함수를 실행
    }
    return 100 / base
}

divide_2(base: 30, success: successThrough, fail: failThrough)
    // 100을 30으로 나누고 정수 형태로 반환

