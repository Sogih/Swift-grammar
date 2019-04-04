/*:
 * 클로저: 일회용 함수를 작성할 수 있는 구문
    * 일회용 함수:
        * 한번만 사용할건데도 함수 형식으로 작성해야 할 때
        * 함수의 이름이 필요 없음, 따라서 Anonymous Func 라고도 함
 */
/*:
 * 클로저 객체
    * global func: 이름 있음, 주변 환경에서 캡처할 어떤 값도 없는 클로저
    * nested func: 이름 있음, 자신을 둘러싼 함수로부터 값을 캡처할 수 있는 클로저
    * 클로저 표현식: 이름 없음, 주변 환경으로부터 값을 캡처할 수 있는 경량 문법으로 작성된 클로저
 */
/*:
 * 클로저 표현식
    * __shape:__
        * `{ (`parameter type`) -> (`return type`) in` \
          Syntax to execute \
          `}`
    * 함수와 형태면에서 차이점
        * func 키워드, 함수이름 생략
        * 중괄호가 parameter보다 앞에있음
        * in 키워드를 사용하여 실행 블록의 시작을 표현
        * 반환값이 없을 때 괄호를 생략할 수 없다. `()` 또는 `Void` 필수
 */
//:---
// 상수(변수)에 클로저 표현식을 할당하여 실행
let f = { () -> Void in
    print("The closure is executed")
}
f()

    //클로저를 직접 실행
    ({ () -> Void in
        print("The closure is executed")
    })()
        //클로저 표현식을 ()로 감싸고 뒤에 함수 호출 연산자 ()를 붙임

//매개변수가 있는 형태의 클로저 표현식을 상수에 할당하여 실행
let c = { (s1: Int, s2: String) -> Void in
    print("s1:\(s1), s2:\(s2)")
}
c(1, "closure")

    //클로저를 직접 실행
    ({ (s1: Int, s2: String) -> Void in
        print("s1:\(s1), s2:\(s2)")
    })(1, "closure")
//:---
//정렬 기준이 되는 함수를 작성하고, 이를 sort(by:) 메소드의 인자로 넣어 배열을 정렬
var value = [1, 9, 5, 7, 3, 2]

func order(s1: Int, s2: Int) -> Bool {
    if s1 > s2 {
        return true
    } else {
        return false
    }
}
value.sort(by: order)

//함수 order를 클로저 표현식으로 바꾸어 작성
{
    (s1: Int, s2: Int) -> Bool in
    if s1 > s2 {
        return true
    } else {
        return false
    }
}

    //위의 클로저 표현식을 sort 메소드의 인자값으로 바로 사용
    value.sort(by: {
        (s1: Int, s2: Int) -> Bool in
        if s1 > s2 {
            return true
        } else {
            return false
        }
    })
