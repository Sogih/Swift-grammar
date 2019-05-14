/*:
 * Ingeritance(상속)
    * 한 클래스가 다른 클래스에서 정의된 프로퍼티나 메소드를 물려받아 사용하는 것
    * 부모 클래스 = 상위 클래스 = 슈퍼 클래스 = 기본 클래스
    * 자식 클래스 = 하위 클래스 = 서브 클래스 = 파생 클래스
    * 단일 상속만 가능 (하나의 클래스만 상속받을 수 있음)
 */
//클래스 A 정의
class A {
    var name = "Class A"
        //저장 프로퍼티, 초기값 "Class A" 할당
    var description: String {
        return "This class name is \(self.name)"
    }   //연산 프로퍼티, 읽기 전용
    
    func foo() {
        print("\(self.name)'s method foo is called")
    }   //메소드
}

let a = A()
    //인스턴스 생성, 할당

a.name
a.description
a.foo()
//:---
/*:
 * subclassing
    * 기존에 있는 클래스를 기반으로 하여 새로운 클래스를 작성
 */
//클래스A를 사용하여 클래스B를 서브클래싱
class B: A{
    //A: 부모클래스, B: 자식클래스
    var prop = "Class B"
    
    func boo() -> String {
        return "Class B prop = \(self.prop)"
    }
}

let b = B()

b.prop
b.boo()

b.name = "Class C"
b.foo()
    //클래스 B에는 name 프로퍼티와 foo 메소드가 정의되어 있지 않지만
    //클래스 A를 상속 받음으로써 모든 프로퍼티와 메소드를 물려받았으므로
    //A의 프로퍼티나 메소드 등을 사용할 수 있음


//상속에 대한 개념적인 예제
class Vehicle {
    var currentSpeed = 0.0
        //저장 프로퍼티
    
    var description: String {
        return "시간당 \(self.currentSpeed)의 속도로 이동하고 있습니다"
    }   //연산 프로퍼티, 읽기 전용
    
    func makeNoise() {
        //임의의 교통수단 자체는 경적을 울리는 기능이 필요없습니다.
    }   //메소드, 아무 기능x
}

let baseVehicle = Vehicle()
baseVehicle.description

class Bicycle: Vehicle {
    var hasBasket = false
        //자전거에 부착되는 바구니 여부
}   //부모 클래스 vehicle, 자식 클래스 bicycle

let bicycle = Bicycle()
bicycle.hasBasket = true
    //바구니를 장착한 자전거
bicycle.currentSpeed = 20.0
    //자전거 객체의 현재 속도
print("자전거: \(bicycle.description)")

class Tandem: Bicycle {
    var passengers = 0
}   //자식클래스 Tandem, 부모클래스 Bicycle, 부모클래스의 부모클래스 Vehicle
    //Tandem은 부모클래스 뿐만 아니라 부모클래스의 부모클래스의 프로퍼티와 메소드 또한 모두 상속받음

let tandem = Tandem()

tandem.hasBasket = true
tandem.passengers = 2
tandem.currentSpeed = 14.0

print("Tandem : \(tandem.description)")
//:---
/*:
 * Overriding
    * 자식 클래스에서 재정의된 메소드나 프로퍼티는 부모 클래스로부터 물려받은 내용을 덮어씀
    * 자기 자신 또는 자신을 서브클래싱한 하위 클래스에만 적용됨
    * 프로퍼티를 오버라이딩 할 때 상위 클래스의 프로퍼티가 저장 프로퍼티든 연산 프로퍼티든 상관없이 연산 프로퍼티로 오버라이딩 해야함
        * 오버라이딩 하는 프로퍼티는 get, set 구문을 모두 제공해야함 (읽기 전용으로 오버라이딩 불가)
        * <=> 프로퍼티 오버라이딩은 상위 클래스의 기능을 하위 클래스가 확장 또는 변경하는 방식으로 진행해야하고, 제한하는 방식으로 진행되어서는 안된다
 */
//프로퍼티의 오버라이딩 예제
class Car: Vehicle {
    //상위클래스 Vehicle, 하위클래스 Car
    
    var gear = 0
    var engineLevel = 0
    //저장 프로퍼티
    
    override var currentSpeed: Double {
        get {
            return Double(self.engineLevel * 50)
        }
        set {
            //아무것도 하지 않음
        }
    }   //상위클래스 Vehicle의 저장 프로퍼티인 currentSpeed를 읽고 쓰기 가능한 연산 프로퍼티로 오버라이딩(재정의)
    
    override var description: String {
        get {
            return "Car : engineLevel=\(self.engineLevel). so currentSpeed=\(self.currentSpeed)"
        }
        set {
            print("New Value is \(newValue)")
        }
    }   //상위클래스 Vehicle의 읽기 전용 연산 프로퍼티인 description을 읽고 쓰기 가능한 연산 프로퍼티로 오버라이딩
    
}

let c = Car()

c.engineLevel = 5
c.currentSpeed
c.description = "New Class Car"

print(c.description)


//자동 기어 차량에 대한 객체 속성 정의 클래스
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            self.gear = Int(currentSpeed / 10.0) + 1
        }
    }
}   //currentSpeed : '상위클래스의 상위클래스'의 저장 프로퍼티
    //gear : 현재 속도에 따른 자동 기어 수
    //didSet : 옵저버, 현재 속도가 변할 때 그에 따라 기어 수도 함께 변경될 수 있도록


//메소드 오버라이딩
class Bike: Vehicle {
    override func makeNoise() {
        print("빠라빠라빠라밤")
    }
}   //메소드 오버라이딩
        //오버라이딩 대상이 되는 메소드의 매개변수 개수나 타입, 반환타입은 변경할 수 없음
        //매개변수의 순서도 변경 불가

let bk = Bike()
bk.makeNoise()
//:---
/*:
 * overloading
    * 하나의 메소드 이름으로 여러가지 메소드를 만들어 쌓는 것
    * 같은 이름의 메소드라도 정의된 매개 변수의 타입이 다르면 서로 다른 메소드로 처리
    * 매개변수명까지 메소드의 정의에 포함되므로 매개변수의 개수, 타입이 일치하여도 매개변수명이 다르면 새로운 메소드를 정의한 것이됨
    * 오버라이딩하는 대상 메소드의 매개변수 타입이 달라지거나 매개변수의 개수가 달라지면 오버로딩 문법에 의해 새로운 메소드로 인식하므로, 이 경우 override 키워드를 붙이지 않아야 함
 */
//오버라이딩의 적용 범위
class HybridCar: Car {
}   //상위 클래스 car (vehicle을 상위클래스로 하는 하위클래스)
    //하위 클래스 hybridcar

class KickBoard: Vehicle {
}   //상위 클래스 vehicle (더이상 상위클래스가 없는 최상위클래스)
    //하위 클래스 kickboard

let h = HybridCar()
h.description   //description은 최상위 클래스의 프로퍼티지만 차상위 클래스인 Car에서 오버라이드(재정의)
                //오버라이드의 경우 해당 클래스를 포함한 하위클래스에서만 적용되고 상위클래스는 그대로임
                //즉, 오버라이드는 현재의 자신 클래스부터 적용

let k = KickBoard()
k.description
//:---
/*:
 * super.someMethod() / super.someProperty
    * 상속받은 부모 클래스의 인스턴스를 참조
    * 오버라이딩 도기 전 본래의 프로퍼티나 메소드를 사용
 * final func ~ / final var ~
    * 상위 클래스에서 정의한 메소드나 프로퍼티가 하위 클래스에서 오버라이딩되는 것을 차단
    * final 키워드를 클래스 자체에 붙인 경우 이 클래스를 서브클래싱 할 수 없음
 */
//final 프로퍼티/메소드
class Vehicle2 {
    final var currentSpeed = 0.0
        //오버라이딩을 차단한 저장 프로퍼티
    final var description: String {
        //오버라이딩을 차단한 연산 프로퍼티
        get {
            return "시간당 \(self.currentSpeed)의 속도로 이동하고 있습니다"
        }
    }
    final func makeNoise() {
    }   //오버라이딩을 차단한 메소드
}


//final 클래스
final class Vehicle3 {
    
}   //오버라이딩을 차단한 클래스
