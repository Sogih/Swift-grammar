/*:
 * Enumeration
    * 하나의 주제로 연관된 데이터들이 멤버로 구성되어 있는 자료형 객체
    * 집단 자료형과의 차이점
        * 데이터를 삭제하거나 변경할 수 없다
        * 열거형의 데이터 멤버들은 타입으로 사용할 수 있다
        * 개별 데이터를 컴파일러가 미리 인지할 수 있다
            * 런 하지 않고 오류 확인 가능
    * 집단 자료형보다 열거형을 사용하는 것이 좋은 경우
        * 원치 않는 값이 잘못 입력되는 것을 막고싶을 때
        * 입력받을 값을 미리 특정할 수 있을 때
        * 제한된 값 중에서만 선택할 수 있도록 강제하고 싶을 때
    * 열거형의 멤버로 정의할 수 있는 데이터 집합
        * 불연속된 값들의 집합 (이산형 자료)
        * 공통 주제에 연관되는 값들로 구성
        * 종류가 유한할 것
    * 열거형 이름의 표기법 : 카멜 표기법을 따른다
        * 첫 글자만 대문자 ex.Direction
        * 여러 단어로 구성된 이름은 각 단어의 첫 글자를 대문자로 ex.SouthKorea
        * 다만, 열거형의 멤버는 소문자로 쓴다
 */
//:---
//열거형의 정의
enum Direction {
    case north
        //north: 멤버값
    case south
    case east, west
        //여러 멤버를 한꺼번에 정의하는 것도 가능하다
        //한꺼번에 정의해도 각각 하는거랑 똑같다
        //한꺼번에 선언할 수 있는 멤버의 개수 제한x
}

//열거형의 사용
let N = Direction.north
let S = Direction.south
let E = Direction.east
let W = Direction.west
    //N,S,E,W은 Direction으로 타입이 추론됨

var directionToHead: Direction = Direction.west

directionToHead = .east
    //이미 타입이 Direction으로 정의되었으므로 열거형 타입명을 생략하고 .멤버값만 사용할 수 있다

/*:
 * 열거형 타입으로 정의된 변수에는 열거형 타입명을 생략하고 멤버값만 대입해도 오류가 발생하지 않는다
 * 변수나 상수의 타입 어노테이션을 명시한 경우, 처음부터 타입명을 생략하고 멤버값만 대입해도 오류가 발생하지 않는다
 * 타입 어노테이션 없이 변수나 상수를 초기화할 때 타입명은 생략할 수 없다
 */
//:---
//switch 구문과 열거형
var directionToHead2 = Direction.west

switch directionToHead2 {
    case .north :
        print("북쪽입니다")
    case .south :
        print("남쪽입니다")
    case .east :
        print("동쪽입니다")
    case .west :
        print("서쪽입니다")
}   //열거형에 정의된 멤버를 switch 구문의 case 블록 비교에 전부 사용하면 default 구문은 생략 가능
//:---
//멤버와 값의 분리
enum HTTPCode: Int {
    case OK = 200
    case NOT_MODIFY = 304
    case INCORRECT_PAGE = 404
    case SERVER_ERROR = 500
}   //멤버에 별도의 값을 대입할 수 있다
    //선언할 때 타입을 지정해주어야한다 (멤버가 받는 값의 타입)

HTTPCode.OK.rawValue
HTTPCode.NOT_MODIFY.rawValue
HTTPCode.INCORRECT_PAGE.rawValue
HTTPCode.SERVER_ERROR.rawValue
    //문자열 형식의 멤버에 할당된 값을 읽을 때
    //rawValue는 열거형 멤버가 값을 저장하고 있을 때에만 사용 가능


//열거형 객체의 멤버에 실질적을 값을 '자동 할당'
enum Rank: Int {
    case one = 1
    case two, three, four, five
}

Rank.one.rawValue
Rank.two.rawValue
Rank.three.rawValue
Rank.four.rawValue
Rank.five.rawValue


//자동 할당은 마지막으로 직접 대입된 값에서 +1씩
enum Rank2: Int {
    case one = 10
    case two = 20
    case three, four, five
}

Rank2.one.rawValue
Rank2.two.rawValue
Rank2.three.rawValue
Rank2.four.rawValue
Rank2.five.rawValue


//사용하는 시점에서 멤버에 보조 값을 설정하는 방법 - Associated Values (연관값)
enum ImageFormat {
    case JPEG
    case PNG(Bool)
        //배경의 투명한지 여부
    case GIF(Int, Bool)
        //사용된 컬러 수, 애니메이션 여부
}

var newImage: ImageFormat
newImage = .PNG(true)
newImage = .GIF(256, false)


//열거형에 연산 프로퍼티와 메소드를 추가
enum HTTPCode2: Int {
    case OK = 200
    case NOT_MODIFY = 304
    case INCORRECT_PAGE = 404
    case SERVER_ERROR = 500
    
    var value: String {
        return "HTTPCode number is \(self.rawValue)"
    }   //연산 프로퍼티
    
    func getDescription() -> String {
        switch self {
        case .OK :
            return "응답이 성공했습니다. HTTP 코드는 \(self.rawValue)입니다."
        case .NOT_MODIFY :
            return "변경된 내용이 없습니다. HTTP 코드는 \(self.rawValue)입니다."
        case .INCORRECT_PAGE :
            return "존재하지 않는 페이지입니다. HTTP 코드는 \(self.rawValue)입니다."
        case .SERVER_ERROR :
            return "서버 오류입니다. HTTP 코드는 \(self.rawValue)입니다."
        }
    }   //메소드
    
    static func getName() -> String {
        return "This Enumeration is HTTPCode"
    }   //타입 메소드
}


//열거형의 연산 프로퍼티, 메소드 호출
var response = HTTPCode2.OK
response = .NOT_MODIFY

response.value
    //연산 프로퍼티 호출
response.getDescription()
    //메소드 호출
HTTPCode2.getName()
    //타입 메소드 호출
//:---

