/*:
 * optinal chain
    * 옵셔널 타입으로 정의된 값이 하위 프로퍼티나 메소드를 가지고 있을 때, 이 요소들을 if 구문을 쓰지 않고도 간결하게 사용할 수 있는 코드를 작성하기 위해 도입됨
 */
//옵셔널 타입의 사용
struct Human {
    var name: String?
        //옵셔널타입 name
    var man: Bool = true
}

struct Company {
    var ceo: Human?
        //옵셔널타입 ceo
    var companyName: String?
        //옵셔널타입 companyName
}

var startup: Company? = Company(ceo: Human(name: "니대표", man: false), companyName: "루비페이퍼")
    //옵셔널타입 startup

startup?.ceo
    //옵셔널 체인
    //startup 변수에 nil 값이 할당되어 있더라도 잘못된 참조에 의한 오류는 발생하지 않는다.

startup?.ceo?.name
    //옵셔널 타입인 name을 참조
/*:
 * 🍕옵셔널 체인으로 참조된 값은 무조건 옵셔널 타입으로 반환된다
 * 🍜옵셔널 체인 과정에서 옵셔널 타입들이 여러번 겹쳐 있더라도 중첩되지 않고 한번만 처리된다
 */
//🍕옵셔널 체인 구문에서 마지막에 오는 값이 옵셔널 타입이 아닌 일반 값인 경우
startup?.ceo?.man
    //옵셔널 타입으로 변경된다


//🍜옵셔널 체인 과정에서 옵셔널 타입들이 여러번 겹쳐있는 경우
Optional(Optional(Optional(123))) == Optional(123)
    //결국 몇번 겹쳐도 중첩되는게 아니고 nil이냐 정상값이냐 그것만이 문제인것


//메소드에서의 옵셔널 체인 사용
struct Company2 {
    
    var ceo: Human?
    var companyName: String?
    
    func getCEO() -> Human? {
        return self.ceo
    }   //getCEO메소드, Human타입의 값을 반환
        //메소드 자체를 옵셔널 체인으로 사용하는 것이 아니라 메소드의 결과값을 옵셔널 체인으로 사용하는 것임
        //메소드 자체를 옵셔널 체인 형식으로 사용하는 것은 옵셔널 메소드일 때문 가능 (프로토콜에서 설명)
}

var someCompany: Company2? = Company2(ceo: Human(name: "팀 쿡", man: true), companyName: "Apple")

let name = someCompany?.getCEO()?.name
if name != nil {
    print("대표이사 이름은 \(name!)입니다.")
}

