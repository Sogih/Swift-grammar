//자식 클래스는 본래의 타입 대신 부모 클래스 타입으로 선언하여 사용할 수 있음
class Vehicle {
    
    var currentSpeed = 0.0
    
    func accelerate() {
        self.currentSpeed += 1
    }
}   //부모클래스

class Car: Vehicle {
    
    var gear: Int {
        return Int(self.currentSpeed / 20) + 1
    }
    
    func wiper() {

    }
}   //자식클래스

let trans: Vehicle = Car()
    //상수 trans는/ 부모클래스인 Vehicle 클래스 타입으로 선언되어/ 자식클래스인 Car 인스턴스를 할당
    //반대로 Car 클래스 타입으로 선언된 상수에 Vehicle 인스턴스를 할당하는 것은 불가능
    //즉, 클래스의 인스턴스를 할당하기 위해서는 해당 변수나 상수가 적어도 인스턴스의 타입과 같거나 또는 그보다 상위 클래스 타입이어야만 함


//자식 클래스는 상위 클래스라면 바로 상위 클래스 뿐만아니라 최상위 클래스의 타입으로 선언될 수 있다
class SUV: Car {
    var fourWheel = false
}   //최상위:vehicle -> 상위:car -> 하위:SUV

let jeep: Vehicle = SUV()
    //최상위 클래스의 타입으로 선언되어도 하위클래스의 인스턴스를 할당하는 것이 가능하다


//인자값 타입으로 클래스를 선언할 때 인자값의 가능 범위
func move(param: SUV) {
    param.accelerate()
}   //인자값으로 입력된 객체를 가속해주는 함수
    //suv타입의 인스턴스를 인자값으로 입력받아서 accelerate() 메소드를 실행
    //'매개변수 param이 SUV 타입이다' -> '매개변수 param은 SUV 클래스이거나 적어도 이 클래스를 상속받은 하위 클래스의 인스턴스만 인자값으로 사용할 수 있다'

func move(param: Vehicle) {
    param.accelerate()
}   //인자값으로 받을 수 있는 범위가 더 넓어짐 (accelerate는 최상위클래스 vehicle의 메소드)

var list = [SUV]()
list.append(SUV())

var list2 = [Vehicle]()

list2.append(Vehicle())
list2.append(Car())
list2.append(SUV())
//:---
/*:
 * 타입 비교 연산
    * is
    * 변수(상수) 또는 인스턴스에 연산자를 사용하면 타입이 일치하는지 여부를 비교함
    * 연산자 왼쪽 인스턴스의 타입이 연산자 오른쪽 비교대상 타입과 일치하거나, 하위 클래스일 경우 - true
 */
//인스턴스 그자체와 클래스 타입을 비교하는 경우
SUV() is SUV    //인스턴스 is 타입
SUV() is Car    //최상위클래스 vehicle -> 차상위클래스 car -> 하위클래스 suv
SUV() is Vehicle

Car() is Vehicle
Car() is SUV

//❗️인스턴스가 할당된 변수와 클래스 타입을 비교하는 경우
let myCar: Vehicle = SUV()

if myCar is SUV {
    print("myCar는 SUV 타입입니다")
} else {
    print("myCar는 SUV 타입이 아닙니다")
}   //myCar에 최상위클래스인 Vehicle의 타입이 선언되었지만
    //실제 타입 비교 연산은 그 안에 대입된 실제 값의 타입임
    //따라서 false가 아닌 true 반환

let newCar: Vehicle = Car()
    //newCar에 최상위클래스의 타입을 선언하였지만 실제 대입된 값은 차상위클래스인 Car()

if newCar is SUV {
    //newCar의 실제 할당된 값에 대한 타입과 SUV 타입을 비교연산
    //newCar:상위클래스 타입 > SUV:하위클래스 타입
    //so, return false
    print("newCar는 SUV 타입입니다")
} else {
    print("newCar는 SUV 타입이 아닙니다")
}
//:---
/*:
 * 타입 캐스팅 연산
    * 타입을 변환할 수 있는 기능
    * 일반적으로 상속 관계에 있는 타입들 사이에서 허용됨
    * 연산자 'as'
    * Up Casting
        * 하위 클래스 타입 -> 상위 클래스 타입 (추상화)
        * 일반적으로 캐스팅 과정에서 오류가 발생할 가능성이 없음
    * Down Casting
        * 상위 클래스 타입 -> 하위 클래스 타입 (구체화)
        * 캐스팅 과정에서 오류가 발생할 가능성이 있음
        * 오류에 대한 처리 방식에 따른 다운 캐스팅 분류 (다운 캐스팅 과정에서 오류가 발생하면 nil이 반환)
            * 옵셔널 캐스팅 : 옵셔널 타입으로 반환 (오류 발생이 기대될 때) (as?)
            * 강제 캐스팅 : 일반 타입으로 반환 (오류가 발생하지 않을 것으로 기대될 때) (as!)
 */
//up casting
let anyCar: Car = SUV() //(상위->하위) Vehicle->Car->SUV
let anyVehicle = anyCar as Vehicle  //Car->Vehicle 타입 추상화


//down casting
let anySUV = anyCar as? SUV //car 타입->suv 타입 down casting
if anySUV != nil {  //anyCar에 할당된 본래 값이 SUV 인스턴스이므로 다운캐스팅 성공
    print("\(anySUV!) 캐스팅이 성공하였습니다")
}
    //위의 구문을 한줄로 축약한 형태
    if let anySUV = anyCar as? SUV {
        print("\(anySUV) 캐스팅이 성공하였습니다")
    }


//강제 캐스팅 구문 사용 - 다운 캐스팅이 반드시 성공할 것이라는 확신이 있을 때
let anySUV2 = anyCar as! SUV
print("\(anySUV2) 캐스팅이 성공하였습니다")
//:---
/*:
 * AnyObject
    * 모든 종류의 클래스 타입을 저장할 수 있는 범용 타입의 클래스
    * 가장 추상화된 클래스
    * 가장 상위 클래스
    * 모든 클래스의 인스턴스는 AnyObject 클래스 타입으로 선언된 변수나 상수에 할당할 수 있음
    * 모든 클래스의 인스턴스는 AnyObject 타입으로 선언된 함수나 메소드의 인자값으로 사용될 수있음
    * AnyObject 타입을 반환하는 함수나 메소드는 모든 종류의 클래스를 반환할 수 있음
    * 고정된 하나의 타입만을 저장할 수 있는 배열이나 딕셔너리, 집합에서도 AnyObject 타입을 사용할 수 있음 (모든 클래스를 저장할 수 있다는 뜻)
    * 타입 캐스팅을 통해 구체적인 타입으로 변환할 수 있음
    * 
 */
