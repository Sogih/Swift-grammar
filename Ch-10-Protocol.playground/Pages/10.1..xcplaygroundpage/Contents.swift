/*:
 * Protocol
    * 클래스나 구조체가 어떤 기준을 만족하거나 또는 특수한 목적을 달성하기 위해 구현해야 하는 메소드와 프로퍼티의 목록
    * 프로토콜의 역할은 특정 기능이나 속성에 대한 '설계도' (구체적인 내용은 프로토콜을 이용하는 객체에서)
    * 프로토콜의 명세 : 프로토콜에 선언된 프로퍼티나 메소드의 형식
    * 프로토콜의 구현 : 명세에 맞추어 실질적인 내용을 작성
 */
//:---
/*:
 * 프로토콜을 구현할 수 있는 것들
    * Structure
    * Class
    * Enumeration
    * Extension
 */
//프로토콜 프로퍼티 선언
protocol SomePropertyProtocol {
    var name: String { get set }
    var description: String { get }
}   //초기값 할당 불가능
    //연산 프로퍼티, 저장 프로퍼티 구분x
    //의도하는 프로퍼티가 연산 프로퍼티 일때
        //get set : 읽기/쓰기
        //get : 읽기 전용


//프로토콜 프로퍼티 구현
struct RubyMember: SomePropertyProtocol {
    var name = "홍길동"
        //저장 프로퍼티
    var description: String {
        return "Name : \(self.name)"
    }   //연산 프로퍼티
}   //프로토콜에서 선언된 프로퍼티 누락하면 오류발생
    //프로토콜에서 선언되지 않은 프로퍼티를 추가하는 것은 가능
//:---
//프로토콜 메소드 선언
protocol SomeMethodProtocol {
    func execute(cmd: String)
    func showPort(p: Int) -> String
}   //인자값, 반환값 타입의 정의는 선택사항
    //메소드 선언뒤에 중괄호{} 없음 (클래스에서 메소드와 차이점)
    //실제 실행내용 작성x


//프로토콜 메소드 구현
struct RubyService: SomeMethodProtocol {
    func execute(cmd: String) {
        if cmd == "start" {
            print("실행합니다")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p)"
    }
}   //프로토콜에 선언된 메소드 중에서 일부를 구현하지 않고 누락하면 오류
    //프로토콜에 정의되어 있지 않은 메소드를 구현체에 추가하는 것은 가능
    //매개변수명을 일치시켜야함


//외부 매개변수명이 포함된 프로토콜 메소드와 그 구현
protocol NewMethodProtocol {
    func execute(cmd command: String, desc: String)
    func showPort(p: Int, memo desc: String) -> String
}
    //외부 매개변수 cmd, 내부 매개변수 command
    //외부, 내부 통합 매개변수 desc

struct RubyNewService: NewMethodProtocol {
    func execute(cmd cmm: String, desc d: String) {
        if cmm == "start" {
            print("\(d)를 실행합니다")
        }
    }   //외부 매개변수 cmd, 내부 매개변수 cmm
        //외부 매개변수 desc, 내부 매개변수 d
            //외부 매개변수는 무조건 일치 시킨다 (통합 매개변수 마찬가지)
            //내부 매개변수는 상관없다
    
    func showPort(p: Int, memo desc: String) -> String {
        return "Port : \(p), Memo : \(desc)"
    }
}
//:---
/*:
 * mutating
    * 구조체나 열거형 내의 메소드가 프로퍼티를 변경하는 경우
        * 클래스는 참조 타입의 객체이므로 메소드 내부에서 프로퍼티를 수정하더라도 mutating 키워드가 필요없음
    * 프로토콜에 선언되지 않은 mutating 키워드를 임의로 구현할 수 없다
        * 프로토콜 메소드에 mutating 선언되었다고해서 구현할 때 반드시 mutating 있어야 하는것은 아니다
    * 구현체의 프로퍼티 수정에 대한 통제 권한이 프로토콜에 있다
    * 프로토콜에서 메소드 선언에 mutating이 없는 경우
        * 객체에서 내부 프로퍼티의 값을 변경하기를 원하지 않을 때
        * 주로 클래스를 대상으로 간주하고 작성된 프로토콜일 때
 */
//mutating protocol method
protocol MService {
    mutating func execute(cmd: String)
    func showPort(p: Int) -> String
}

struct RubyMService: MService {
    var paramCommand: String?

    mutating func execute(cmd: String) {
        self.paramCommand = cmd
        if cmd == "start" {
            print("실행합니다")
        }
    }
    
    func showPort(p: Int) -> String {
        return "port : \(p), now command : \(self.paramCommand!)"
    }
}
//:---
/*:
 * static
    * 타입 메소드나 타입 프로퍼티를 프로토콜에 정의할 때
    * 클래스에서 타입 메소드를 선언할 때 사용할 수 있는 또 다른 키워드인 class는 프로토콜에서 사용불가
    * 클래스에서 구현할 때는 static, class 키워드 모두 가능
    * 구조체나 열거형은에서 구현할 때는 static만 가능
 */
//프로토콜에 타입 메소드, 타입 프로퍼티를 정의하여 구현
protocol SomeTypeProperty {
    static var defaultValue: String { get set }
    static func getDefaultValue() -> String
}

struct TypeStruct: SomeTypeProperty {
    static var defaultValue = "default"
    
    static func getDefaultValue() -> String {
        return defaultValue
    }
}

class ValueObject: SomeTypeProperty {
    static var defaultValue = "default"
    class func getDefaultValue() -> String {
        return defaultValue
    }
}
//:---
/*:
 * 프로토콜에서의 초기화 메소드
    * 반환 타입 없음
    * 이름은 init으로 통일
 */
//프로토콜에 초기화 메소드 정의
protocol SomeInitProtocol {
    init()  //매개변수가 없는 초기화 메소드
    init(cmd: String)   //멤버와이즈 초기화 메소드
}


/*:
 * 초기화 메소드가 포함된 프로토콜을 구현할 때
    * 구현되는 초기화 메소드의 이름과 매개변수명은 프로토콜의 명세에 작성된 것과 완전히 일치해야 함
    * 프로토콜 명세에 선언된 초기화 메소드는 그것이 기본 제공되는 초기화 메소드일지라도 직접 구현해야 함
    * 클래스에서 초기화 메소드를 구현할 때는 required 키워드 붙여야 함
 */
//초기화 메소드가 포함된 프로토콜 구현
struct SInit: SomeInitProtocol {
    var cmd: String
    
    init() {
        self.cmd = "start"
    }   //매개변수가 없는 초기화 메소드
    
    init(cmd: String) {
        self.cmd = cmd
    }   //멤버와이즈 초기화 메소드
}   //프로토콜에서 두개의 초기화 메소드 선언했기 때문에
    //구현체인  SInit에서도 두개의 초기화 구문을 모두 구현해야 함

class CInit: SomeInitProtocol {
    var cmd: String
    
    required init() {
        self.cmd = "start"
    }
    
    required init(cmd: String) {
        self.cmd = cmd
    }
}   //클래스의 경우 프로토콜에서 선언한 초기화 메소드에 대해
    //구현체에서도 초기화 메소드를 구현하고 또한 required 키워드까지 추가 해야함
//:---
/*:
 * 클래스는 상속과 프로토콜 구현이 동시에 가능한 객체
    * 부모 클래스로부터 메소드, 프로퍼티를 상속 받으면서 동시에
    * 프로토콜에 정의된 메소드, 프로퍼티를 구현할 수 있음
 * 상속을 통해 초기화 메소드를 물려받았다 할지라도 구현해야 할 프로토콜 명세에 동일한 초기화 메소드가 선언되어 있다면 이를 다시 구현해야함
    * 부모 클래스의 관점에서 볼 때 상속받은 초기화 메소드를 오버라이드하는 셈
    * 이런 경우, 초기화 메소드에 required 키워드와 override 키워드 모두 써줘야
 */
//부모 클래스로부터 초기화 메소드를 상속받고, 프로토콜에 정의된 그 초기화 메소드를 구현
protocol Init {
    init()
}

class Parent {
    init() {
    }
}   //부모 클래스

class Child: Parent, Init {
        //부모 클래스가 있는경우 상속에 대한 선언부터 먼저해줘야함
        //ex. Init, Parent (x)
    override required init() {
    }
}   //자식 클래스 + 프로토콜 구현
    //override , required 순서 상관x
    //override from Parent
    //required from protocol
//:---
/*:
 * 타입으로서의 프로토콜
    * 상수나 변수, 그리고 프로퍼티의 타입으로 사용할 수 있음
    * 함수, 메소드 또는 초기화 구문에서 매개변수 타입이나 반환 타입으로 프로토콜을 사용할 수 있음
    * 배열이나 사전, 혹은 다른 컨테이너의 타입으로 사용할 수 있음
 */
//상수에 프로토콜 타입을 타입어노테이션
protocol Wheel {
    func spin()
    func hold()
}

class Bicycle: Wheel {
        //Wheel 프로토콜 구현
    var moveState = false
    
    func spin() {
        self.pedal()
    }   //구현 메소드
    
    func hold() {
        self.pullBreak()
    }   //구현 메소드
    
    func pedal() {
        self.moveState = true
    }
    
    func pullBreak() {
        self.moveState = false
    }
}

let trans = Bicycle()
    //type-Bicycle (타입추론)
    //상수 trans가 사용할 수 있는 프로퍼티, 메소드 목록
trans.moveState
trans.spin()
trans.hold()
trans.pedal()
trans.pullBreak()

let trans2: Wheel = Bicycle()
    //type-Wheel (타입어노테이션)
    //상수 trans2가 사용할 수 있는 프로퍼티, 메소드 목록
trans2.hold()
trans2.spin()
    //실질적으로 trans2에 할당된 객체는 Bicycle() 인스턴스 이지만
    //trans2의 타입이 wheel 프로토콜 타입이므로
    //사용할 수 있는 메소드, 프로퍼티 역시 포로토콜 타입에 선언된 것으로 제한됨


//두개의 프로토콜을 타입으로 하는 경우
protocol A {
    func doA()
}

protocol B {
    func doB()
}

class Impl: A, B {
    func doA() {
    }
    
    func doB() {
    }
    
    func desc() -> String {
        return "Class instance method"
    }
}

var ipl: A & B = Impl()
    //A프로토콜과 B프로토콜 모두를 포함하는 객체 타입
    //두 프로토콜을 모두 구현한 객체만 할당받을 수 있음
    //따라서 desc()는 사용 불가
ipl.doA()
ipl.doB()
//:---
/*:
 * Delegation
 */
