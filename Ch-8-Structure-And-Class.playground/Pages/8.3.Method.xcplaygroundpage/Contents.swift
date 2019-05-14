/*:
 * Method
    * 특정 타입의 객체 내부에서 사용하는 함수
    * instance method
        * 객체의 인스턴스를 생성해야 사용할 수 있는 메소드
        * 틀을 이용하여 만들어 낸 구체적이고 실질적인 것에 관련된 메소드
    * type mehtod
        * 객체의 인스턴스를 생성하지 않아도 사용할 수 있는 메소드
        * 원형이나 틀에 관련된 메소드
 */
//:---
//구조체 내에서 인스턴스 메소드 선언
struct Resolution {
    var width = 0
    var height = 0
    
    func desc() -> String {
        //인스턴스 메소드
        //객체 타입 내부에 선언된다는 점을 제외하고는 일반 함수와 선언 형식이 완전 동일
        //일반 함수와 차이점
            //구조체와 클래스의 인스턴스에 소속됨
            //메소드 내에서 정의된 변수와 상수뿐만 아니라 클래스 범위에서 정의된 프로퍼티도 모두 참조 가능
            //self 키워드를 사용할 수 있음
        let desc = "이 해상도는 \(self.width) * \(self.height)로 구성됩니다."
            //인스턴스 메소드 내에서 프로퍼티를 읽어올 경우 'self.프로퍼티명' 형식으로 참조
            //self 생략 가능하지만 메소드 내부에 프로퍼티와 동일한 이름을 가진 변수(상수) 선언되었을때는 불가능
        return desc
    }
}


//클래스 내에서 인스턴스 메소드 선언
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
        //옵셔널 타입
    
    func desc() -> String {
        if self.name != nil {
            let desc = "이 \(self.name!) 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
                //nil이 아니면 강제 해제 연산자 사용
            return desc
        } else {
            let desc = "이 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
            return desc
        }
    }
}


//self 키워드를 사용하여 프로퍼티와 일반 변수를 구분하는 예
struct Resolution2 {
    var width = 0
        //프로퍼티
    var height = 0
    
    func judge() -> Bool {
        let width = 30
            //일반 변수
        return self.width == width
            //self.width : 프로퍼티 / width : 일반변수
            //이런 경우 self 생략 불가
    }
}


//인스턴스 메소드의 선언과 호출
class Counter {
    
    var count  = 0
        //변수 프로퍼티
    
    func increment() {
        self.count += 1
    }   //인스턴스 메소드
    
    func incrementBy(amount: Int) {
        self.count += amount
    }   //인스턴스 메소드
        //amount 만큼 증가
    
    func reset() {
        self.count = 0
    }   //인스턴스 메소드
        //카운트를 0으로 초기화
}

let counter = Counter()
    //클래스 Counter의 인스턴스 생성
counter.increment()
    //인스턴스 메소드 호출
    //인스턴스 메소드는 반드시 인스턴스를 통해서만 호출될 수 있다
counter.incrementBy(amount: 5)
    //인자값이 있는 메소드 호출
counter.reset()


//구조체에서- 프로퍼티의 값을 수정하는 인스턴스 메소드
struct Point {
    
    var x = 0.0, y = 0.0
    
    mutating func moveByX(x deltaX: Double, y deltaY: Double) {
        //❗️구조체에서 정의된 인스턴스 메소드 내부에서 프로퍼티의 값을 수정할 때는 반드시 메소드의 앞에 mutating
        self.x += deltaX
        self.y += deltaY
    }
}
var point = Point(x: 10.5, y: 12.0)
    //인스턴스를 상수로 할당 받으면 mutating 메소드를 호출할수 없음
point.moveByX(x: 3.0, y: 4.5)
print("이제 새로운 좌표는 (\(point.x), \(point.y))입니다")

//in class - instance method that's modifying the property's value.
class Location {
    
    var x = 0.0, y = 0.0
    
    func moveByX(x deltaX: Double, y deltaY: Double) {
        //❗️클래스에서 정의된 인스턴스 메소드 내부에서 프로퍼티의 값을 수정할 때는 별도의 키워드가 필요없음
        self.x += deltaX
        self.y += deltaY
    }
}

var loc = Location()
loc.x = 10.5
loc.y = 12.0
loc.moveByX(x: 3.0, y: 4.5)
print("이제 새로운 좌표는 (\(loc.x), \(loc.y))입니다")
//:---
/*:
 * 타입 메소드
    * 인스턴스를 생성하지 않고도 객체 타입 자체에서 호출할 수 있는 메소드
    * 타입 메소드를 선언할 때는 static 키워드 사용
    * 클래스의 경우 하위 클래스에서 재정의 가능한 타입 메소드를 선언할 때 class 키워드 사용
    * 타입 메소드를 사용하여 객체의 값을 변경하면 해당 객체 타입을 사용하는 모든 곳에서 변경된 값이 적용됨
    * 타입 메소드 자체에 인스턴스가 존재하지 않기 때문에 인스턴스 프로퍼티 참조불가
    * 따라서 타입 메소드에서 사용할 수 있는 프로퍼티는 오직 타입 프로퍼티
 */
//타입 메소드
class Foo {
    
    class func fooTypeMethod() {
        
    }   //타입 메소드 (하위 클래스)
}
