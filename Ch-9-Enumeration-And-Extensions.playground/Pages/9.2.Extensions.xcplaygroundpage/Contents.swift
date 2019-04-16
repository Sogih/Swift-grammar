/*:
 * Extensions
    * 이미 존재하는 클래스나 구조체, 열거형 등의 객체에 새로운 기능을 추가하여 확장해주는 구문
    * 익스텐션을 통해 구현할 수 있는 것들
        * 새로운 연산 프로퍼티를 추가할 수 있다
        * 새로운 메소드를 정의할 수 있다
        * 새로운 초기화 구문을 추가할 수 있다
        * 기존 객체를 수정하지 않고 프로토콜을 구현할 수 있다
    * 객체가 아니며 또한 타입으로 사용될 수도 없다
 */
//:---
/*:
 * 익스텐션과 연산 프로퍼티
    * 익스텐션을 이용해서 기존 객체에 연산 프로퍼티를 추가할 수 있다
        * 저장 프로퍼티는 추가할 수 없다
        * 인스턴스 프로퍼티든 타입 프로퍼티든 연산 프로퍼티라면 모두 추가 가능
 */
//자료형 Double의 구조체 확장 구문
extension Double {
    var km: Double { return self * 1_000.0 }
        //1000 == 1_000
        //under bar는 자릿수 구분용, 아무 의미 x
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var description : String {
        return "\(self)km는 \(self.km)m, \(self)cm는 \(self.cm), \(self)mm는 \(self.mm)m입니다."
    }   //네개의 연산 프로퍼티
}

2.km
5.5.cm
123.mm
7.0.description
    //호출

let distance = 42.0.km + 195.m
print("마라톤의 총 거리는 \(distance)m입니다.")
//:---
/*:
 * 익스텐션과 메소드
    * 기존 객체에 새로운 인스턴스 메소드나 타입 메소드를 정의할 수 있다
        * 기존 객체에서 사용된 같은 메소드를 익스텐션에서 재정의하는 것은 안된다
 */
//Int 구조체를 확장
extension Int {
    func repeatRun(task: () -> Void) {
        for _ in 0 ..< self {
            task()
        }
    }   //메소드
        //() -> Void 형식의 함수를 인자값으로 받는다
        //인자값으로 받은 함수를 Int 자료형에 할당된 값만큼 반복해서 실행
}

let d = 3
d.repeatRun(task: {
    print("Hello world!")
})  //클로저를 인자값으로

d.repeatRun {
    print("Hello Earth!")
}   //Trailing closure 문법 사용


//mutating : 구조체나 열거형에서 정의된 메소드가 자기 자신의 인스턴스를 수정하거나 프로퍼티를 변경해야 할 때
    //익스텐션이 구조체나 열거형을 확장의 대상으로 삼았을 때가 이에 해당됨
extension Int {
    mutating func square() {
        self = self * self
    }   //Int 구조체에 익스텐션을 이용하여 square()메소드 정의
}

var value = 3
    //메소드가 인스턴스 자체의 값을 변경하고 있으므로 값을 상수에 할당해서는 안 된다
value.square()
//:---
//익스텐션을 활용한 코드 정리
import UIKit

public class DataSync {
    public func save(_ value: Any, forKey: String) { ... }
    public
}
