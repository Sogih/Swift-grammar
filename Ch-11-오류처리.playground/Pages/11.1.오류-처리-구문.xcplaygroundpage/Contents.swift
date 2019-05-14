/*:
 ## ✨ 오류 처리 구문
 ---
 * "throw errors" <=> "오류가 함수의 반환 타입과 일치하지 않아도 된다"
 */



/*:
 ## 오류 타입 정의하기
 ---
 * 오류 처리를 위해서 오류 정보를 담아 함수나 메소드 외부로 던질 '오류 타입 객체'가 필요함
 * '오류 타입 객체'에 하나의 일관된 오류 주제에 소속된 '여러 가지 오류'를 정의하므로 주로 '열거형'으로 선언
 * 오류 타입으로 사용되는 열거형은 반드시 Error라는 프로토콜을 구현해야한다
 */
//오류 타입 정의하기-예제


enum DateParseError: Error {
    case overSizeString
    case underSizeString
    case incorrectFormat(part: String)
    case incorrectData(part: String)
}   //에러 프로토콜 구현

/*:
 ## ⚾️ 오류 던지기
 ---
 * 오류 타입 객체는 함수나 메소드를 실행하는 과정에서 필요에 따라 외부로 던져 실행 흐름을 옮겨버릴 수 있다.
 * 함수나 메소드에 'throws' 키워드를 추가하여 오류 객체를 외부로 던질 수 있음을 표시한다
 * 선언할 때 throws, 사용할 때 throw
*/
//throws 키워드의 사용 예시 - 함수
    //func canThrowErrors() throws -> String
    //func cannotThroweErrors() -> String


//throws 키워드 사용 예시 - 클로져
    //{() throws -> String in
    //...
    //}


//날짜를 분석하는 함수를 작성하고, 실행과정에서 발생할 수 있는 오류 상황에서 오류 객체 던지기
import Foundation
    // 파운데이션 라이브러리 호출
    // for using NSString, NSRange

struct Date {
    var year: Int
    var month: Int
    var date: Int
}   //날짜 정보를 담아서 반환할 구조체

func parseDate(param: NSString) throws -> Date {
    // 입력된 문자열의 길이가 10이 아닐 경우 분석이 불가능하므로 오류
    guard param.length == 10 else { // 길이가 10일때만 구문 계속 진행
        if param.length > 10 {
            throw DateParseError.overSizeString
        } else {
            throw DateParseError.underSizeString
        }
    }
    
    // 반환할 객체 타입 선언
    var dateResult = Date(year: 0, month: 0, date: 0)
    
    // 연도 정보 분석
    if let year = Int(param.substring(with: NSRange(location: 0, length: 4))) { // 앞에 4자리만
        dateResult.year = year
    } else {
        // 연도 분석 오류
        throw DateParseError.incorrectFormat(part: "year")
    }
    
    // 월 정보 분석
    if let month = Int(param.substring(with: NSRange(location: 5, length: 2))) {
        // 월에 대한 값은 1 ~ 12 까지만 가능하므로 그 이외의 범위는 잘못된 값으로 처리한다
    guard month > 0 && month < 13 else {
        throw DateParseError.incorrectData(part: "month")
    }
    dateResult.month = month
    } else {
        // 월 분석 오류
        throw DateParseError.incorrectFormat(part: "month")
    }
    
    // 일 정보 분석
    if let date = Int(param.substring(with: NSRange(location: 8, length: 2))) {
        // 일에 대한 값은 1 ~ 31 까지만 가능하므로 그 이외의 범위는 잘못된 값으로 처리한다.
    guard date > 0 && date < 32 else {
        throw DateParseError.incorrectData(part: "date")
        }
        dateResult.date = date
    } else {
        // 일 분석 오류
        throw DateParseError.incorrectFormat(part: "date")
    }


    return dateResult
}

try parseDate(param: "2020-02-28")
    //throws를 사용하는 함수의 호출


/*:
 ## 🧤 오류 객체 잡아내기
 ---
 ```{swift}
 do {
    try <오류를 던질 수 있는 함수>
 
 } catch <오류 타입1> {
    // 오류 타입1에 대한 대응
 } catch <오류 타입2> {
    // 오류 타입2에 대한 대응
 } catch ...
 ```
 * do 구문은 오류가 발생하지 않는 상황에서 실행할 구문이 작성되는 영역
 * try 함수 호출에서 오류가 던져지면 이를 catch 구문으로 전달함
 */
//예시
func getPartsDate(date: NSString, type: String) {
    do {
        let date = try parseDate(param: date)
        
        switch type {
        case "year" :
            print("\(date.year)년입니다.")
        case "month" :
            print("\(date.month)월입니다.")
        case "date" :
            print("\(date.date)일입니다.")
        default :
            print("입력값에 해당하는 날짜정보가 없습니다.")
        }
        
    } catch DateParseError.overSizeString {
        print("Too long")
    } catch DateParseError.underSizeString {
        print("Too short")
    } catch DateParseError.incorrectFormat(let part) {
        print("입력값의 \(part)에 해당하는 형식이 잘못되었습니다.")
    } catch DateParseError.incorrectData(let part) {
        print("입력값의 \(part)에 해당하는 값이 잘못사용되었습니다. 확인해주세요.")
    } catch {
        print("알 수 없는 오류가 발생하였습니다.")
    }
}

getPartsDate(date: "2019-05-02", type: "year")
getPartsDate(date: "2019-13-02", type: "month")
getPartsDate(date: "2019-05-00", type: "date")


//오류를 던지도록 설계된 함수나 메소드이지만, 필요에 의해 오류를 던지지 않게 하고 싶을 때 - try 대신 try!
let date = try! parseDate(param: "2015-09-31")
print("\(date)") 
