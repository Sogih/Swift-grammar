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
/*:
 * computed property
    * 실제 값을 저장했다가 반환하지는 않고 대신 다른 프로퍼티의 값을 연산 처리하여 간접적으로 값을 제공
     * get{...return 반환값}:
     * set{...}: 연산 프로퍼티에 값을 할당하거나 변경. 생략가능.
     * 클래스, 구조체 또는 열거형의 내부에서만 사용
 */
//연산 프로퍼티 사용- 나이 계산
import Foundation

struct UserInfo {
    
    var birth: Int!
        //저장 프로퍼티- 묵시적 옵셔널 타입
    
    var thisYear: Int! {
        //연산 프로퍼티- 올해가 몇년도인지 계산
        get {
            let df = DateFormatter()
            df.dateFormat = "yyyy"
            return Int(df.string(from: Date()))
        }
    }
    
    var age: Int {
        //연산 프로퍼티- 나이 계산
        get {
            return (self.thisYear - self.birth) + 1
        }
    }
}

let info = UserInfo(birth: 1992)
print(info.age)

//연산 프로퍼티 사용- 사각형의 중심좌표 계산
struct Rect {
    var originX: Double = 0.0, originY: Double = 0.0
    
    var sizeWidth: Double = 0.0, sizeHeight: Double = 0.0
    
    var centerX: Double {
        get {
            return self.originX + (sizeWidth / 2)
        }
        set(newCenterX) {
            originX = newCenterX - (sizeWidth / 2)
        }
    }
    var centerY: Double {
        get {
            return self.originY + (self.sizeHeight / 2)
        }
        set(newCenterY) {
            self.originY = newCenterY - (self.sizeHeight / 2)
        }
    }
}

var square = Rect(originX: 1.0, originY: -1.0, sizeWidth: 3.0, sizeHeight: 3.0);
print("square.centerX = \(square.centerX), square.centerY = \(square.centerY)")


//연산 프로퍼티 사용- 사각형의 중심좌표 계산- 객체 지향 구조화
struct Position {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

struct Rect2 {
    var origin = Position()
    
    var size = Size()
    
    var center: Position {
        get {
            let centerX = self.origin.x + (self.size.width / 2)
            let centerY = self.origin.y + (self.size.height / 2)
            return Position(x: centerX, y: centerY)
        }
        set(newCenter) {
            self.origin.x = newCenter.x - (size.width / 2)
            self.origin.y = newCenter.y - (size.height / 2)
        }   //연산 프로퍼티 center에 값을 할당하면
            //newCenter라는 매개변수에 인자값으로 전달하고 구문을 실행한다
            //매개변수 생략가능 (이 경우 newValue로 인자명 사용됨)
            //set{} 구문을 제거하면 읽기 전용 프로퍼티 <=> get-only <=> read-only
            //즉, 프로퍼티를 통해 값을 읽기만 할 뿐 할당은 할 수 없음 (쓰기 불가)
            //이때 get 구문을 생략 가능하다
                // var center: Position {
                // ...
                // return ...
                // }
    }
}

let p2 = Position(x: 20.0, y: 20.0);
let s2 = Size(width: 10.0, height: 10.0)

var square2 = Rect2(origin: p2, size: s2)
print("square2.centerX = \(square2.center.x), square2.centerY = \(square2.center.y)")

square2.center = Position(x: 20.0, y: 20.0)
    //연산 프로퍼티 center에 구조체로 정의된 인스턴스를 할당
    //<=> 중심 좌표 20,20
square2.origin.x
square2.origin.y
//:---
/*:
 * Property Observer
     * willSet : 프로퍼티의 값이 변경되기 직전에 호출되는 옵저버
     * didSet : 프로퍼티의 값이 변경된 직후에 호출되는 옵저버
 */
//프로퍼티 옵저버 예제
struct Job {
    var income: Int = 0 {
        willSet(newIncome) {
            //property인 income에 할당될 새로운 값을 매개상수 newIncome으로 전달받음
            print("이번 달 월급은 \(newIncome)원입니다.")
        }
        didSet {
            //매개상수 선언 생략 (oldValue로 자동선언됨)
            //property인 income에 새롭게 할당되기 전의 값이 매개상수 oldValue에 전달됨
            if income > oldValue {
                print("월급이 \(income - oldValue)원 증가하셨네요. 소득세가 상향조정될 예정입니다.")
            } else {
                print("저런, 월급이 삭감되었군요, 그래도 소득세는 깎아드리지 않아요, 알죠?")
            }
        }
    }
}
var job = Job(income: 1000000) //Job 인스턴스 생성
job.income = 2000000
job.income = 1000000
    // 프로퍼티 값 변경 시작 -> willSet 구문 실행 -> 프로퍼티 값 변경 -> didSet 구문 실행
//:---
/*:
 * Type Property
    * 클래스나 구조체 자체에 값을 저장
    * 저장된 값은 모든 인스턴스가 공통으로 사용할 수 있음
    * 모든 인스턴스가 하나의 값을 공용으로 사용
    * 프로퍼티 앞에 static 키워드 추가하여 정의
    * 인스턴스 생성 과정에서 초기값을 할당할 수 없기 때문에 선언할 때 초기값 반드시 할당해야 함
 */
//
struct Foo {
    
    static var sFoo = "구조체 타입 프로퍼티값"
        //타입 저장 프로퍼티
    
    static var cFoo: Int {
        //타입 연산 프로퍼티
        return 1
    }
}


class Boo {
    
    static var sFoo = "클래스 타입 프로퍼티값"
        //타입 저장 프로퍼티
    
    static var cFoo: Int {
        //타입 연산 프로퍼티
        return 10
    }
    
    class var oFoo: Int {
        //재정의가 가능한 타입 연산 프로퍼티
        return 100
    }
}

print(Foo.sFoo)
    //인스턴스 생성 없이 사용 가능
Foo.sFoo = "새로운 값"
print(Foo.sFoo)
    //새로운 값 할당 가능
print(Boo.sFoo)
    //클래스 타입 프로퍼티값
print(Boo.cFoo)
