//: [Previous](@previous)

//:---
String(920314)
//정수값을 문자열로 만들기-생성자, 초기화메소드
Int("920314")
//문자열을 정수열로 만들기. 숫자로 구성된 문자열이어야 한다. "홍길동"이런건 안됌.
//:---
let name = "꼼꼼한 재은씨"
let year = 2014
let month = 10
let day = 1

print("\(name)는 \(year)년 \(month)월, \(day)일에 출간되었습니다.")
//문자열 템플릿을 사용한 문자열 결합
//:---
//Quoting? 문자(열)을 따옴표로 묶어 표시하는 방법
"Hello" //문자열 string
"H" //문자 character

let headerLetter01 = "5" //type: String
let headerLetter02: Character = "5" //type: Character
//타입 어노테이션이 없을 때 선언된 value 만으로 하나의 type을 결정할 수 없다면 더 넓은 범위의 타입으로 결정한다
//:---
//Tripple quoting: 멀티 라인 스트링, 더블 쿼우팅보다 간편하게 여러줄 작성 가능
print("""
계절이 지나가는 하늘에는
가을로 가득 차 있습니다.
""")
//시작 쿼우팅 다음에 반드시 줄바꿈후 값을 작성해야 한다.
//쿼우팅을 종료하는 라인에서는 쿼우팅 앞에 어떤 값도 들어갈 수 없다.

//double quoting으로 여러줄 작성 하는 법
print("계절이 지나가는 하늘에는\n"
+ "가을로 가득 차 있습니다.")

//: [Next](@next)
