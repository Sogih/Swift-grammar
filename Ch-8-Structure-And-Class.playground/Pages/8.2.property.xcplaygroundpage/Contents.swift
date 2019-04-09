/*:
 * __instance property__: 인스턴스에 소속되어 사용하는 프로퍼티
    * __stored property__
        * 입력된 값을 저장하거나 저장된 값을 제공하는 역할
        * 상수 및 변수를 사용해서 정의 가능
        * 클래스와 구조체에서는 사용이 가능하지만, 열거형에서는 사용할 수 없음
    * __computed property__
        * 특정 연산을 통해 값을 만들어 제공하는 역할
        * 변수만 사용해서 정의 가능
        * 클래스, 구조체, 열거형 모두에서 사용 가능
 * __type property__: 구조체, 클래스 자체에 소속되어 값을 가지므로 인스턴스를 생성하지 않아도 사용 가능
 */
//:---
/*:
 * stored property
    1. 클래스 내에서 선언된 변수나 상수
    2. 기본적으로 선언 시 초기값을 할당해 주어야 함
    2. 프로퍼티 선언 시 초기값이 할당되지 않은 저장 프로퍼티는 반드시 옵셔널 타입으로
        * 클래스의 프로퍼티에 값이 비어 있으면 인스턴스를 생성할 때 무조건 nil 값으로 초기화하기 때문
    3. 일반 옵셔널 타입과 묵시적 옵셔널 해제 타입 중에서 선택
    4. 선언 시에 초기값을 주지 않으면서도 옵셔널 타입으로 선언하지 않을 수 있는 방법
        * 초기화 구문에서 프로퍼티의 값을 초기화
 */
//:---
//4.ex-초기화 구문을 작성하고, 그 안에서 초기값을 할당
class User {
    var name: String
    
    init() {
        self.name = ""
    }
}

//3.ex-프로퍼티를 옵셔널 타입으로
class User2 {
    var name: String?
}   //기본 옵셔널 타입

class User3 {
    var name: String!
}   //묵시적 옵셔널 해제 타입
    //사용 시점에서는 절대 nil이 되지 않을 보장이 있는 경우

//2.ex-프로퍼티에 초기값 할당
class User4 {
    var name: String = ""
}
//:---
/*:
 * 저장 프로퍼티 분류
    * 변수형 저장 프로퍼티
        * var로 정의
        * 멤버 변수
    * 상수형 저장 프로퍼티
        * let으로 정의
        * 멤버 상수
 */
//:---
//구조체에서 저장 프로퍼티
struct FixedLengthRange {
    var startValue: Int
    let length: Int
}   //고정 길이 범위 구조체

var rangeOfFixedIntegers = FixedLengthRange(startValue: 0, length: 3)
    //변수 인스턴스
rangeOfFixedIntegers.startValue = 1
    //변수 인스턴스 + 멤버 변수 = 변경 가능
//rangeOfFixedIntegers.length = 4
    //변수 인스턴스 + 멤버 상수 = 변경 불가능

let rangeOfFixedIntegersWithCons = FixedLengthRange(startValue: 0, length: 4)
    //상수 인스터턴스
//rangeOfFixedIntegersWithCons.startValue = 1
    //상수 인스턴스 + 멤버 변수 = 변경 불가능
//rangeOfFixedIntegersWithCons.lenth = 4
    //상수 인스턴스 + 멤버 상수 = 변경 불가능


//클래스에서 저장 프로퍼티
    //인스턴스를 상수에 할당해도 클래스 내에서 변수로 선언한 저장 프로퍼티는 값을 변경할 수 있다
    //클래스는 값 전달 방식이 참조 방식이므로
    //클래스는 저장 프로퍼티의 값이 바뀌더라도
    //상수에 할당된 인스턴스의 레퍼런스는 변경되지 않는다
//:---
/*:
* 일반 저장 프로퍼티
    * 인스턴스가 처음 생성될 때 함께 초기화됨
* 지연 저장 프로퍼티
    * 프로퍼티가 호출되는 순간에 초기화됨
 */
//지연 저장 프로퍼티 예제
class OnCreate {
    init() {
        print("OnCreate!")
    }   //클래스의 초기화 구문 (인스턴스 생성 시 실행할 내용을 담은 블록)
}

class LazyTest {
    
    var base = 0
    lazy var late = OnCreate()
        //지연 저장 프로퍼티
        //프로퍼티의 초기값으로 OnCreate 클래스의 인스턴스를 할당
        //지연 저장에 할당된 인스턴스는 프로퍼티가 처음 호출되는 시점에서 생성됨
    
    init() {
        print("Lazy Test!!")
    }
}

let lz = LazyTest()
    //여기까지는 OnCreate 인스턴스가 생성되지 않았다가
lz.late
    //여기서 생성됨
//:---
/*:
 * 클로저를 이용한 저장 프로퍼티 초기화
 */
//클로저 구문을 이용하여 프로퍼티 초기화
class PropertyInit {
    
    var value01: String! = {
        print("value01 execute")
        return "value01"
    }() //변수를 사용한 저장 프로퍼티
    
    let value02: String! = {
        print("value02 execute")
        return "value02"
    }()   //상수를 사용한 저장 프로퍼티
}

let s = PropertyInit()
    //인스턴스를 생성하면서 프로퍼티를 초기화하여 클로저가 실행됨
s.value01
s.value02
    //클로저 실행 안됨- 인스턴스 생성 시 최초 한 번만 실행

//클로저 구문을 이용하여 지연 프로퍼티 초기화
class PropertyInit2 {
    
    lazy var  value03: String! = {
        print("value03 execute")
        return "value"
    }()
}

let s1 = PropertyInit2()
    //클로저 실행 안됨
s1.value03
    //해당 프로퍼티를 참조하면서 클로저가 실행됨
s1.value03
    //지연 프로퍼티를 초기화하는 클로저는 최초로 지연 프로퍼티를 참조하는 때 한 번만 실행
//:---

