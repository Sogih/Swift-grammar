//: [Previous](@previous)
/*:
 * Array
     * Index를 가진다
     * 배열에 저장할 타입에는 제약이 없지만, 하나의 배열에 저장하는 아이템 타입은 모두 같아야 함
     * 선언 시 배여렝 저장할 아이템 타입을 명확히 정의해야 함
     * 배열의 크기는 동적으로 확장할 수 있음
 */
//:---
// 정적(static)인 방식으로 배열 선언
    // ㄴ선언과 동시에 배열을 구성하는 아이템을 포함하여 정의함
var cities = ["Seoul", "New York", "LA", "Santiago"]
cities[0]
cities[1]
cities[2]
cities[3]
//:---
// 배열의 순회 탐색_배열의 길이를 직접 다루는 방식
var cities_2 = ["Seoul", "New York", "LA", "Santiago"]
let length = cities_2.count // 배열의 길이
for i in 0..<length {
    print("\(i)번째 배열 원소는 \(cities_2[i])입니다")
}

// 배열의 순회 탐색2_Iterator(배열 순회 특성)를 이용하는 방법
var cities_3 = ["Seoul", "New York", "LA", "Santiago"]
for row in cities_3 {
    // for~in 구문에 순번을 가진 범위 데이터를 넣으면 데이터의 크기만큼 반복 실행
    // 매 루프마다 루프상수 row에 cities의 아이템이 차례대로 추출되어 할당
    // cities의 아이템이 문자열이므로 루프 상수 역시 문자열 타입으로 선언됨
    print("배열 원소는 \(row)입니다")
}

// Iterator를 이용하는 방법에서 인덱스 값을 추출하는 방법
var cities_4 = ["Seoul", "New York", "LA", "Santiago"]
for row in cities_4 {
    let index = cities_4.index(of: row)
    // 배열의 아이템 value를 통해서 index를 추출
    print("\(index!)번째 배열 원소는 \(row)입니다")
}
//:---
/*:
 * 배열의 동적 선언과 초기화
     * __Generic__: <> 기호를 사용하여 배열 내부에서 사용할 아이템 타입을 지정하는 문법
     * __Declare__: 이러이러한 배열을 만들겁니다라고 컴파일러에 미리 알려주는 역할
     * __initialization__: 앞서 선언한 대로 시제로 만들어주세요라고 요청하는 과정
 */
// 배열의 선언과 초기화 스타일
var cities_5 = [String]() // 선언 + 초기화
var country : [String] = [] // 타입어노테이션 + 초기화
var rows : Array<Float> = [Float]() // 타입어노테이션 + 제네릭 + 초기화
var tables : [String] = Array() // 타입어노테이션 + 구방식의 초기화

// 선언된 배열이 실제로 비어 있는지를 체크하는 방법
var list = [String]()

if list.isEmpty {
    print("배열이 비어 있는 상태입니다")
} else {
    print("배열에는 \(list.count)개의 아이템이 저장되어 있습니다")
}

/*:
 * 배열 아이템 동적 추가
    * `append(_:)`: 입력된 값을 배열의 맨 뒤에 추가, 추가 전에 인덱스의 공간을 확보할 것
    * `insert(_:at:)`: 배열의 원하는 위치에 직접 추가
    * `append(contentsOf:)` 배열의 맨 뒤에 배열을 추가 (여러 개의 아이템 추가 가능)
 */
//example
var cities_6 = [String]() // 선언+초기화
cities_6.count
cities_6.append("Seoul")
cities_6.append("New York")
cities_6.insert("Tokyo", at: 1)
cities_6.append(contentsOf: ["Dubai", "Sydney"])
cities_6[2] = "Madrid" //입력된 배열값 변경
    //배열의 인덱스를 이용하여 직접 아이템에 접근하는 방식으로
    //기존의 있는 값을 수정할 수는 있지만, 값을 추가할 수는 없다
    //즉, 이미 인덱스가 확보되어 있어야 한다.

//배열을 생성하는 방법 중에서 초기화할 때 배열의 크기를 지정할 수 있다
var cities_7 = Array(repeating: "None", count: 3)
    //array구조체는 [] 기호로 대체할 수 있으므로 다음과 같이 바꿔도 된다.
    //var cities_7 = [String](repeating: "None", count: 3)
    //배열의 인덱스가 개수만큼 미리 정의되고, 기본값이 각각 추가된 상태로 배열이 만들어진다
print(cities_7)
//:---
//범위 연산자를 이용하여 배열의 인덱스를 참조
var alphabet = ["a", "b", "c", "d", "e"]

alphabet[0...2]
alphabet[2...3]

//범위 연산자를 배열 아이템의 수정에 적용
 //1.범위 연산자로 읽어 들인 배열의 크기보다 더 큰 아이템을 할당하는 경우
  alphabet[1...2] = ["1", "2", "3"] //index1,2의 아이템을 삭제하고 3개의 아이템을 추가
  alphabet //배열의 크기가 늘어났다
 //2.범위 연산자로 읽어 들인 배열의 크기보다 더 작은 아이템을 할당하는 경우
  alphabet[2...4] = ["A"] //index1,2의 아이템을 삭제하고 1개의 아이템을 추가
  alphabet //배열의 크기가 줄어들었다

//: [Next](@next)
