/*:
 * 초기화
    * 구조체나 클래스를 정의한 후에 인스턴스를 생성해서 메모리 공간을 할당받는것
    * 모든 저장 프로퍼티는 인스턴스 생성 과정에서 초기화되어야 함
    * 모든 저장 프로퍼티에 초기값이 지정되어 있다면 기본 초기화 구문을 사용하여 인스턴스를 생성할 수 있음
*/
//기본 초기화 구문
    //Resolution()
    //Video()
    //Location()
    //SUV()
    //Car()
    //Vehicle()


//멤버와이즈 초기화 구문 (구조체에서만 제공되는 기능)
    //Point(x: 10.5, y: 12.0)
        //구조체 내부에 선언된 모든 저장 프로퍼티를 일괄로 외부의 값으로 초기화함
//:---
/*:
 * 기본 구문 이외의 형식으로(ex.x는 원래 내부에서 초기화된 값으로, y만 외부의 값으로 초기화 하고 싶을 때) 원하는 인자값을 전달하여 저장 프로퍼티를 초기화 하려면 반드시 구조체나 클래스 내부에 그에 맞는 형태와 할 일을 미리 정의해 두어야함
 * 이때 사용되는 것이 '초기화 메소드'임
 * 인스턴스가 생성될 때의 형식과 할 일을 정의한다고 하여 Constructor(생성자)라 부름
 */
//:---
/*:
 * 초기화 메소드
    * 이름은 init으로 통일된다
    * 매개변수의 개수, 이름, 타입은 임의로 정의할 수 있다 (이에 따라 인스턴스 생성과정에서 넣어야하는 인자값의 순서와 형식이 결정됨)
    * 매개변수의 이름과 개수, 타입이 서로 다른 여러 개의 초기화 메소드를 정의할 수 있다
    * 정의된 초기화 메소드는 직접 호출되기도 하지만, 대부분 인스턴스 생성 시 간접적으로 호출된다
 */
//초기화 메소드 사용 예제
struct Resolution {
    var width = 0
    var height = 0
    
    init(width: Int) {
        self.width = width
    }   //초기화 메소드 : Width를 인자값으로 받음
        //width를 제외한 저장 프로퍼티는 내부의 초기값을 그대로 쓰겠단 뜻
}

class VideoMode {
    
    var resolution = Resolution(width: 2048)
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    init(interlaced: Bool, frameRate: Double) {
        self.interlaced = interlaced
        self.frameRate = frameRate
    }   //초기화 메소드 : interlaced, frameRate 두 개의 인자값을 받음
}

let resolution = Resolution.init(width: 4096)
    //Resolution 구조체에 대한 인스턴스 생성하여 상수 resolution에 할당
let videoMode = VideoMode.init(interlaced: true, frameRate: 40.0)
    //VideoMode 클래스에 대한 인스턴스 생성하여 상수 videoMode에 할당


//매개변수의 개수와 타입, 이름이 서로 다른 여러 개의 init 메소드를 정의하여 사용하는 경우
class VideoMode2 {
    var resolution = Resolution(width: 4096)
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    init(name: String) {
        self.name = name
    }
    
    init(interlaced: Bool) {
        self.interlaced = interlaced
    }
    
    init(interlaced: Bool, frameRate: Double) {
        self.interlaced = interlaced
        self.frameRate = frameRate
    }
    
    init(interlaced: Bool, frameRate: Double, name: String) {
        self.interlaced = interlaced
        self.frameRate = frameRate
        self.name = name
    }
}

let nameVideoMode = VideoMode2(name: "SoGihyeon")
let simpleVideoMode = VideoMode2(interlaced: true)
let doubleVideoMode = VideoMode2(interlaced: true, frameRate: 40.0)
let tripleVideoMode = VideoMode2(interlaced: true, frameRate: 40.0, name: "SoGihyeon")
    //객체 내에 init으로 선언된 초기화 메소드가 정의되면 더이상 기본 초기화 구문은 제공하지 않는다
        //즉 "let a = VideoMode()" <- 불가능
        //기본 초기화 구문을 계속 사용하려면 기본 초기화 구문으로 초기화 메소드를 정의해 주어야 한다
            //init() {
            //}


//init 메소드의 매개변수에 기본값을 지정하는 경우
class VideoMode3 {
    var name: String?
    
    init(name: String = "") {
        self.name = name
    }
}

let defaultVideoMode = VideoMode3()
    //초기화 메소드 안에서 기본값이 지정되어 있으므로 인자값을 생략할 수 있다. 결국 기본 초기화 구문처럼 되었다
let name2VideoMode = VideoMode3(name: "SoGihyeon")
    //기본값이 있더라두 새롭게 인자값을 넣어줄 수 있다능
//:---
/*:
 * 초기화 구문의 오버라이딩
    * 클래스에서는 초기화 구문도 오버라이딩할 수 있다
    * 상위 클래스에서 선언된 적이 없는 초기화 형식이리 때는 override 키워드를 붙이면 안됨
    * 다만, 기본 초기화 구문 init(){}은 부모 클래스에서 명시적으로 선언된 적이 없더라도 자식 클래스에서는 반드시 오버라이딩 형식으로 작성해야 한다
*/
//기본 초기화 구문을 오버라이딩
class Base {
}

class ExBase: Base {
    
    override init() {
    }   //초기화 구문을 오버라이딩
        //상위 클래스에 선언된적 없지만 기본 초기화 구문은 기본적으로 있는거라서 override 키워드 생략 불가
    
}   //상위 클래스 base -> 하위 클래스 ExBase


//초기화 구문을 오버라이딩
class Base2 {
    
    var baseValue: Double
    
    init(inputValue: Double) {
        self.baseValue = inputValue
    }   //초기화 할 때 입력받은 인자값을 baseValue에 할당
}

class ExBase2: Base2 {
    
    override init(inputValue: Double) {
        super.init(inputValue: 10.5)
    }   //상위 클래스의 '초기화 구문'이 새롭게 정의 되는 것이므로
        //ExBase2를 초기화 할 때 입력받은 인자값을 baseValue에 할당하지 못함
        //즉, 초기화 구문을 오버라이딩하면 더이상 부모 클래스에서 정의한 초기화 구문이 실행되지 않는다
        //super.init : 부모 클래스에서 정의된 초기화 구문을 내부적으로 호출
            //baseValue 프로퍼티는 옵셔널 타입이 아닌 일반 타입이므로 반드시 초기값이 있어야 하지만 초기화 구문의 오버라이딩으로 인해 초기값 할당 구문이 누락되면 오류가 발생함. 이러한 오류를 방지하기 위해 오버라이딩된 초기화 구문에서 부모 클래스의 초기화 구문을 직접 호출해 주게됨
}
//:---
/*:
 * 초기화 구문 델리게이션 (Initializer Delegation)
    * 연쇄적으로 오버라이딩된 자식 클래스의 초기화 구문에서 부모 클래스의 초기화 구문에 대한 호출이 발생하는 것
    * 초기화 구문을 여러 하위 클래스가 정의하면서 계속해서 오버라이딩 하는 경우
    * 각각의 초기화 구문에서 super.init()구문을 통해, 상위의 초기화 구문을 호출해야한다
    * 연쇄적으로 상위의 초기화 구문을 호출하면서 최상위에 있는 초기화 구문까지 호출이 이어져, 모든 초기화 구문이 누락되지 않고 실행됨
 */
//부모 클래스에 기본 초기화 구문만 정의되어 있거나 기본 초기화 구문이 아예 명시적으로 정의되어 있지 않은 상태에서 자식 클래스가 오버라이딩 할 때
    // super.init() 구문을 호출해주지 않아도 자동으로 부모 클래스의 초기화 구문이 호출된다
        //이때 초기화 구문의 호출 순서: 하위클래스 -> 상위클래스
class Base3 {
    var baseValue: Double
    
    init() {
        self.baseValue = 0.0
        print("Base Init")
    }   //기본 초기화 구문
}

class ExBase3: Base3 {
    override init() {
        print("Exbase Init")
    }   //super.init (x)
}

let ex = ExBase3()


//부모 클래스에 기본 초기화 구문 외에 다른 형식의 초기화 구문이 추가되어 있는 경우
class Base4 {
    var baseValue: Double
    
    init() {
        self.baseValue = 0.0
        print("Base Init")
    }   //기본 초기화 구문
    
    init(baseValue: Double) {
        self.baseValue = baseValue
    }   //기본 초기화 구문 아닌 초기화 구문
}

class ExBase4: Base4 {
    override init() {
        super.init()
        print("ExBase Init")
    }   //super 필요
}
