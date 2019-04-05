/*:
 * 구조체와 클래스의 정의\
`struct Resolution {`\
 `   `\
`}`\
 \
`class VideoMode {`\
`   `\
`}`
 */
        //구조체와 클래스의 이름은 Camel 표기법을 따름
            //Camel 표기법
                //1. 첫 글자는 대문자, 나머지는 소문자 ex.Camel
                //2. 2개 이상의 복합 단어는 단어별로 첫 글자는 대문자, 나머지는 소문자 ex.CamelLight
                //3. 이미 축약된 약어는 모두 대문자로 작성 가능 ex.JSON
                //4. 프로퍼티나 메소드를 선언할 때는 소문자로 시작
                //5. 언더바로 단어를 연결하는 것은 지양
//:---
/*:
 * __Property__: 구조체와 클래스 내부에서 정의된 변수(상수)
 * __Method__: 구조체와 클래스 내부에서 정의된 함수
 */
//property, method
struct Resolution {
    var width = 0
    var height = 0
        //ㄴproperty
        //ㄴ=0: 타입추론에 의해 Int로 정의됨
    func desc() -> String {
        return "Resolution 구조체"
    }   //ㄴmethod
}

class VideoMode {
    var interlaced = false
    var frameRate = 0.0
    var name : String?
        //ㄴoptional 문자열, 초기값이 할당되지 않았으므로 nil로 초기화
    
    func desc() -> String {
        return "VideoMode 클래스"
    }
}
//:---
/*:
 * Instance
    * 구조체나 클래스는 실행할 수 있는 객체가 아니라, 값을 담을 수 있는 실질적인 그릇을 만들어내기 위한 일종의 틀로 생각해야함
    * 즉 Origin 이다.
    * 틀 역할을 하는 클래스나 구조체를 정의하고 이를 바탕으로 실질적으로 값을 담을 여러 개의 그릇을 만들어내는 것, 이것이 객체지향 프로그래밍의 원리
    * 이때 원형 틀을 이용하여 찍어낸 그릇을 Instance라고 함
    * 타입의 설계도를 사용하여 메모리 공간을 할당받은 것이 instance임
 */
//instance 생성
let insRes = Resolution()
    //Resolution 구조체에 대한 인스턴스를 생성하고 상수 insRes에 할당
let insVMode = VideoMode()
    //VideoMode 클래스에 대한 인스턴스를 생성하고 상수 insVMode에 할당

//property 접근
    //인스턴스 없이는 프로퍼티도 존재하지 않는 것임
    //따라서 구조체나 클래스의 이름을 통해서는 프로퍼티에 접근할 수 없음
    //프로퍼티에 접근하려면 반드시 인스턴스를 먼저 생성해야함
let width = insRes.width
print("insRes 인스턴스의 width 값은 \(width)입니다")


//sub-property 접근
class VideoMode2 {
    var interlaced = false
    var frameRate = 0.0
    var name : String?
    
    var res = Resolution()
        //VideoMode2의 property
        //Resolution의 instance
    
    func desc() -> String {
        return "VideoMode 클래스"
    }
}

let vMode = VideoMode2()
print("vMode 인스턴스의 width 값은 \(vMode.res.width)입니다.")

//property에 값을 할당
vMode.name = "Sample"
vMode.res.width = 1280

print("\(vMode.name!) 인스턴스의 width 값은 \(vMode.res.width)입니다.")
//:---
/*:
 * Initialize(초기화)
    * 옵셔널 타입으로 선언되지 않은 모든 프로퍼티는 명시적으로 초기화 해야함
        * 프로퍼티를 선언하면서 동시에 초기값을 지정하거나
        * 초기화 메소드 내에서 프로퍼티의 초기값을 지정해야함
    * <=> 클래스나 구조체의 모든 프로퍼티는 적어도 인스턴스가 생성되는 시점까지는 반드시 초기화 되어야함
    * 구조체는 모든 프로퍼티의 값을 인자값으로 입력받아 초기화하는 기본 초기화 구문 제공
        * 이 초기화 구문을 Memberwise Initializer라고 부름
 */
//initializing In structure
let defaultRes = Resolution(width: 1024, height: 768)
    //(인스턴스 생성 + 프로퍼티 초기화) -> 상수에 할당
    //memberwise Iinitializer
print("width:\(defaultRes.width), height:\(defaultRes.height)")

let insRes2 = Resolution()
    //인스턴스 생성 -> 상수에 할당
    //이 경우 구조체 정의할 때 프로퍼티가 초기화 되어 있어야 함

    //Class의 경우 memberwise initializer가 제공되지 않음
        //클래스 선언시에 프로퍼티를 초기화 해주거나
        //직접 초기화 구문을 정의해서 내부에서 해당 프로퍼티를 초기화해야함
//:---
/*:
 * 구조체의 값 전달 방식: value type (값 타입)
    * 인스턴스를 생성하여 변수(상수)에 할당하거나 함수의 인자값으로 전달할 때 값을 복사하여 전달
    * 모든 구조체는 값 타입임
    * 인스턴스 생성 -> 인스턴스 복사 -> 인스턴스 복사본을 할당
    * 따라서 생성본과 복사본은 독립적
 */
//value type
let hd = Resolution(width: 1920, height: 1080)
    //hd에 인스턴스를 생성하여 할당함
var cinema = hd
    //cinema에 인스턴스를 복사하여 할당함

cinema.width = 2048
    //복사된 인스턴스의 프로퍼티를 초기화함
        //기존 인스턴스인 hd의 프로퍼티에는 변화가 없음 독립이기 때문에
        //cinema가 상수로 선언되었다면 프로퍼티의 초기화도 불가능함

print("cinema 인스턴스의 width 값은 \(cinema)입니다")
print("hd 인스턴스의 width 값은 \(hd.width)입니다")
//:---
/*:
 * 클래스의 값 전달 방식: Reference Type (참조 타입)
    * 인스턴스를 할당할 때 기존 인스턴스가 저장된 메모리 주소 참조에 의해 전달
    * 모든 클래스는 참조 타입
 */
//클래스의 참조 타입
let video = VideoMode()
video.name = "Original Video Instance"

print("Video 인스턴스의 name 값은 \(video.name!)입니다.")

let dvd = video
dvd.name = "DVD Video Instance"
    //dvd에있는 프로퍼티를 초기화하였는데

print("video 인스턴스의 name 값은 \(video.name!)입니다.")
    //video에있는 프로퍼티도 초기화됨
        //같은 메모리 주소를 참조하고 있기 때문

//클래스의 참조 타입2
func changeName(v: VideoMode) {
    //VideoMode 클래스로부터 VideoMode라는 자료형을 정의함
    v.name = "Function Video Instance"
}

changeName(v: video)
print("video 인스턴스의 name 값은 \(video.name!)입니다.")
    //video 인스턴스에도 값이 바뀌었음을 확인

//클래스 인스턴스 비교 연산- 같은 인스턴스인 경우
    // ===: 동일 인스턴스인지 비교 (같은 메모리 공간을 참조하는 인스턴스인지)
    // !==: not
if (video === dvd) {
    print("same instance")
} else {
    print("different instance")
}

//클래스 인스턴스 비교 연산- 다른 인스턴스인 경우
let vs = VideoMode()
let ds = VideoMode()

if (vs === ds) {
    print("same instance")
} else {
    print("different instance")
}
//:---
/*:
 * 다음 조건에 하나 이상 해당하는 경우라면 클래스보다 구조체를 사용하는 것이 좋다
    * 서로 연관된 몇 개의 기본 데이터 타입들을 캡슐화하여 묶는 것이 목적일 때
    * 캡슐화된 데이터에 상속이 필요하지 않을 때
    * 캡슐화된 데이터를 전달하거나 할당하는 과정에서 참조 방식보다는 값이 복사되는 것이 합리적일 때
    * 캡슐화된 원본 데이터를 보존해야 할 때
 */
