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
newCapital.updateValue("Seoul", forKey: "KR") //새로운 키 입력
newCapital.updateValue("London", forKey: "EN") //새로운 키 입력
newCapital.updateValue("Sapporo", forKey: "JP") //기존의 키 수정
    //기존에 저장된 키가 있으면 연결된 값을 수정 - 기존의 value를 return
    //새로운 키가 입력되면 아이템을 추가 - nil을 retrun
print(newCapital)

//💡dictionary에 저장된 item을 제거하는 방법
newCapital.updateValue("Ottawa", forKey: "CA")
newCapital.updateValue("Beijing", forKey: "CN")
    //1️⃣키에 연결된 값에 직접 nil 할당
        newCapital["CN"] = nil
    //2️⃣using method: removeValue(forKey:)
        newCapital.removeValue(forKey: "CA")
        //삭제된 item의 value를 반환
print(newCapital)

//removeValue 반환값의 활용
if let removedValue = newCapital.removeValue(forKey: "JP") {
    print("The value removed is \(removedValue)")
} else {
    print("Nothing was removed")
}
//:---
//dictionary의 순회 탐색 #1.
for row in newCapital {
    let (key, value) = row
    // dictionary에서 꺼낸 key-value 한 쌍이 담긴 row 상수를 tuple로 받는다
    print("Current data is \(key) : \(value)")
}

//dictionary의 순회탐색 #2. 단순화, 직관화
for (key, value) in newCapital {
    print("Current data is \(key) : \(value)")
}   //dictionary는 고유 key에 대한 hash 처리 값을 기준으로 내부 정렬하기 때문에
    //입력한 순서대로 출력되지 않는다
//: [Next](@next)
