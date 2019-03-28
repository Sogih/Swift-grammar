//: [Previous](@previous)
/*:
 * Dictionary
    * key-value
    * 인덱스 정수 대신 문자열 등의 고유 키(key)를 사용
    * 딕셔너리는 불특정 키가 사용되므로 데이터를 입력할 때 반드시 키와 함께 쌍으로 입력해야
    * 하나의 키는 하나의 데이터에만 연결되어야
    * 하나의 딕셔너리에서 키는 중복될 수 없다. 중복해서 선언하면 아이템 추가가아니라 수정이 이루어져 기존 키에 연결된 데이터가 제거된다
    * 저장할 수 있는 데이터 타입에는 제한이 없지만, 하나의 딕셔너리에 저장하는 데이터 타입은 모두 일치해야
    * 아이템에는 순서가 없지만 키에는 내부적으로 순서가 있으므로 for~in 구문을 이용한 순회 탐색 가능
    * 사용할 수 있는 키의 타입은 거의 제한이 없으나 해시(hash) 연산이 가능한 타입이어야 한다
 */
// 딕셔너리의 정적 선언과 값의 정의
var capital = ["KR":"Seoul", "EN":"London", "FR":"Paris"]
    //kr=key, seoul=value
capital["KR"]
//:---
//선언과 초기화- 초기화 연산자에 의해 딕셔너리를 선언함과 동시에 타입을 정의
Dictionary<String, Int>()
    //아무 초기값도 할당하지 않은 빈 딕셔너리를 선언하고 초기화 (방법1)
[String : Int]()
    //<=> 약식 표기 (방법2)

    //example
        var capital_1 = Dictionary<String, String>()
        var capital_2 = [String : String]()

//선언된 dictionary의 초기화
var capital_3 : [String:String] = ["KOR":"Seoul"]
capital_3 = Dictionary<String, String>()

capital_3 = ["KOR":"Seoul"]
capital_3 = Dictionary()

capital_3 = ["KOR":"Seoul"]
capital = [String:String]()

capital_3 = ["KOR":"Seoul"]
capital = [:]
//:---
//dictionary에 독적으로 아이템 추가하기
var newCapital = [String:String]()
newCapital["JP"] = "Tokyo"

//dictionary.isEmpty 속성
if newCapital.isEmpty {
    print("This Dictionary is empty")
} else {
    print("This Dictionary's size is \(newCapital.count)")
}

//메소드를 사용하여 동적으로 value 할당: updateValue(_:forkey:)
    //기존에 저장된 키가 있으면 연결된 값을 수정 - 기존의 value를 return
    //새로운 키가 입력되면 아이템을 추가 - nil을 retrun
newCapital.updateValue("Seoul", forkey: "KR") //새로운 키 입력
newCapital.updateValue("London", forkey: "EN")
print(newCapital)



















//: [Next](@next)
