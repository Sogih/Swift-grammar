//: ## 확장 구문과 프로토콜
//:---
/*:
 * 익스텐션에서 프로토콜을 구현하는 것은 구조체나 클래스, 열거형에서 프로토콜을 구현하는 것과 차이가 거의 없다.
 * 확장하기 전 본래의 객체에서는 프로토콜을 구현하지 않았더라도 익스텐션에서 프로토콜을 구현한다면 이후로 해당 객체는 프로토콜을 구현한 것으로 처리된다.
 * 익스텐션에서 저장 프로퍼티를 정의할 수는 없다. 프로토콜에 정의된 프로퍼티를 익스텐션에서 구현해야 한다면, 연산 프로퍼티로 구현해야 한다.
 */
class Man {
    var name: String?
    
    init(name: String = "홍길동") {
        self.name = name
    }
}

protocol Job {
    func doWork()
}

extension Man: Job {
    //기존 객체-Man, 구현할 프로토콜-Job
    func doWork() {
        print("\(self.name!)님이 일을 합니다")
    }   //프로토콜의 요소에 대한 구현 내용
}

let man = Man(name : "개발자")
man.doWork()

/*:
 ## 프로토콜의 상속
 ---
 * 클래스와 달리 다중 상속이 가능하다.
    * 다중 상속 : 여러 개의 프로토콜을 하나의 프로토콜에 한꺼번에 상속
 * 상위 프로토콜 타입으로 선언된 변수/상수나 함수의 인자값으로 사용될 수 있다.
 * 부모 프로토콜에서의 선언과 자식 프로토콜에서의 선언이 겹치더라도 클래스에서처럼 override 키워드를 붙여야 하는 제약이 없다.
 * is, as 타입 연산자를 사용하여 비교 연산, 변환 가능
    * 선언된 타입이 아니라 할당된 실제 객체의 인스턴스를 기준으로 비교
    * 할당된 객체가 비교 대상 타입과 같거나 비교 대상 타입을 상속받았을 경우 모두 true
 */
//다중 상속
protocol A {
    func doA()
}

protocol B {
    func doB()
}

protocol C: A, B {
    func doC()
}

class ABC: C {
    func doA() {
    }
    
    func doB() {
    }
    
    func doC() {
    }
}   //프로토콜 C의 구현
    //A,B,C의 명세를 모두 구현해야 한다


    //클래스 ABC의 할당과 사용할 수 있는 메소드의 범위
        let abc: C = ABC()
        // abc.doA(), abc.doB(), abc.doC()

        let a: A = ABC()
        // a.doA()

        let ab: A & B = ABC()
        // ab.doA(), ab.doB()

        let abc2: A & B & C = ABC()
        // abc.doA(), abc.doB(), abc.doC()

    //클래스 ABC의 인자값으로의 할당
        func foo(abc: C) { }
        foo(abc: ABC())

        func boo(abc: A & B) { }
        boo(abc: ABC())


//override 키워드 불필요
protocol D: A, B {
    func doA()
    func doB()
    func doC()
}


//프로토콜의 타입 연산
abc is C
abc is A & B
abc is A
abc is B
a is C
a is B
ab is C
abc2 is A & B & C

/*:
 * as 연산자는 다음의 제한된 범위 내에서 타입을 캐스팅할 수 있도록 해준다
    1. 실제로 할당된 인스턴스 타입
    2. 인스턴스가 구현한 프로토콜 타입
    3. 클래스가 상속을 받았을 경우 모든 상위 클래스
    4. 프로토콜 타입이 상속을 받았을 경우 모든 상위 프로토콜
 * 즉, 변수(상수)에 선언된 타입보다 상위 타입으로 캐스팅하는 것은 문제 없다.
 * 그러나 선언된 타입보다 하위 타입으로 캐스팅 할 때는 실제 할당된 인스턴스에 따라 캐스팅 실패할 수 있다
    * 캐스팅 결과값으로 nil이 반환될 수도 있다
    * 따라서 하위 캐스팅에서는 '일반 캐스팅' 대신 '옵셔널 캐스팅(as?)' 또는 '강제 캐스팅(as!)' 사용한다.
        * 옵셔널 캐스팅 : 일반 캐스팅 연산자를 사용하는 대신 옵셔널 타입으로 캐스팅 결과 반환
        * 강제 캐스팅 : 캐스팅 실패 가능성을 감안하고서라도 일반 타입으로 캐스팅
 */
//타입 캐스팅
protocol Machine {
    func join()
}

protocol Wheel: Machine{
    func lotate()
    
    init(name: String, currentSpeed: Double)
}   //Machine -> Wheel 상속

class Vehicle {
    var currentSpeed = 0.0
    var name = ""
    
    init(name: String, currentSpeed: Double) {
        self.name = name
        self.currentSpeed = currentSpeed
    }
}

class Car: Vehicle, Wheel {
    required override init(name: String, currentSpeed: Double = 0.0) {
        super.init(name: name, currentSpeed: currentSpeed)
    }
    
    func join() {
        // join parts
    }
    
    func lotate() {
        print("\(self.name)의 바퀴가 회전합니다.")
    }
}   //Wheel, Vehicle, Machine을 모두 상속 받거나 구현하고 있음
    //-> 각타입으로 캐스팅이 모두 가능

class Carpet: Vehicle, Machine {
    func join() {
        
    }
}   //타입 비교를 위한 클래스 생성

var translist = [Vehicle]()
    //Vehicle 타입의 배열을 선언
    //<=> Vehicle 클래스를 상속받은 객체라면 모두 할당 가능
translist.append(Car(name: "자동차", currentSpeed: 10.0))
translist.append(Carpet(name: "양탄자", currentSpeed: 15.0))
    //Car, Carpet 인스턴스를 할당

for trans in translist {
    if let obj = trans as? Wheel {
        obj.lotate()
    } else {
        print("\(trans.name)의 하위 타입 변환이 실패했습니다.")
    }
}   //translist에 할당된 인스턴스를 순회하면서 Wheel 프로토콜로 옵셔널 캐스팅

/*:
 ## 클래스 전용 프로토콜
 ---
 * 클래스에 의해서만 구현될수 있도록 정의한 프로토콜
 */
//예시
protocol SomeClassOnlyProtocol: class {
    
}
//다른 프로토콜을 상속받는 경우, 맨 앞에 클래스 전용임을 표시해야함
protocol SomeClassOnlyProtocol2: class, Wheel, Machine {
    
}
/*:
 ## optional
 ---
 * 프로토콜의 명세에 포함된 것 중에서 구현하고 싶지 않은 것이 있을 때 사용한다
 * optional 키워드 사용
 * 프로토콜 앞에 @objc 표시
    * @objc 어노테이션이 파운데이션 프레임워크에서 정의되어 있으므로 import Foundation 구문을 통해 파운데이션 프레임워크를 참조할 수 있도록 해줘야 함
 * 이러한 프로토콜은 클래스에서만 구현 가능
 */
//예시
import Foundation

@objc
protocol MsgDelegate {
    @objc optional func onReceive(new:Int)
        //새로운 메시지가 도착했을 때 새로운 메시지의 개수를 델리게이트로 할당된 객체에 알려주는 역할
}

class MsgCenter {
    var delegate: MsgDelegate?
    var newMsg: Int = 0
    
    func msgCheck() {
        if newMsg > 0 { //새로운 메시지가 도착했다면
            self.delegate?.onReceive?(new: self.newMsg)
                //optional 키워드가 붙은 메소드를 호출할 때는 옵셔널 체인처럼 사용하면된다
                //메소드 자체가 옵셔널이므로 '메소드'와 '(...)'사이에 '?'를 넣어준다
                //메소드가 반환하는 값이 일반 값이라도 옵셔널 메소드 형식으로 사용하면 결과값도 옵셔널 타입임
                //해당 메소드를 클래스에서 반드시 구현했다는 확신이 있으면 옵셔널 연산자 대신 강제 해제 연산자!를 사용할 수도 있다
                //이때 메소드의 호출 결과가 성공이라면 메소드의 결과값은 일반 값이 반환됨
            self.newMsg = 0
        }
    }
}

class Watch: MsgDelegate {
    var msgCenter: MsgCenter?
    
    init(msgCenter: MsgCenter) {
        self.msgCenter = msgCenter
    }
    
    func onReceive(new: Int) {
        print("\(new) 건의 메시지가 도착했습니다.")
    }   //onReceive 메소드 구현, 새로운 메시지의 개수를 출력
}
