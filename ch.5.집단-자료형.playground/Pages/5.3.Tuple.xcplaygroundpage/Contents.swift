//: [Previous](@previous)

/*:
 * 튜플
    * 여러 가지 타입의 아이템을 저장할 수 있다
    * 일단 선언되고 나면 더이상 값을 추가하거나 삭제하는 등의 변경이 불가능
    * 인덱스 속성을 이용하여 참조가능
    * 인덱스 속성 외에 메소드가 없다
 */
//:---
//튜플 선언
    let tupleValue = ("a", "b", 1, 2.5, true)
    tupleValue.0 //인덱싱
    //타입어노테이션
        var tpl01 : (Int, String, Int) = (100, "a", 200)
            //들어갈 아이템의 개수와 순서에 맞게 각각의 타입을 선언해야
        var tpl02 : (Int, (String, String)) = (100, ("t", "v"))
            //튜플 내의 아이템으로 튜플을 가질 수 있다
        var tpl03 : (String) = ("sample string")
            //하나의 아이템만 있는 튜플은 튜플이 아니라 일반 자료형으로 선언됨

//Bingding: 튜플의 아이템을 개별 변수나 상수로 각각 할당받음
let tuplevalue_2 : (String, Character, Int, Float, Bool) = ("a", "b", 1, 2.5, true)
let (a,b,c,d,e) = tuplevalue_2
a
b
c
d
e

//결과값으로 튜플을 반환하는 함수
func getTupleValue() -> (String, String, Int) {
    return ("t", "v", 100)
}
let (x,y,z) = getTupleValue()
x
y
z //함수가 반환하는 튜플을 튜플 상수로 binding

//튜플에서 반환되는 아이템 중 일부만 필요할 때
let (q, _, w) = getTupleValue()
    //사용하지 않을 튜플 아이템은 변수나 상수를 정의하는 대신 '_'로 대체
    //언더바로 표현된 부분에 해다앟는 아이템은 할당하지 않고 패스
    //언더바를 포함한 전체 변수나 상수의 개수는 튜플의 아이템 개수와 일치해야
q
w
    //함수는 항상 하나의 객체만 반환할 수 있으므로 여러 자료를(더군다나 자료형도 다른) 한꺼번에 반환하기 위해서 튜플이 활용된다.


//: [Next](@next)
