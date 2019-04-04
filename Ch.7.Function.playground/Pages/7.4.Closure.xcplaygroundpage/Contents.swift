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
        * 반환값이 있다면 반환 표현을 생략하여 컴파일러가 타입 추론을 하도록 할 수 있다. (ex: line 80)
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

//함수 order를 클로저 표현식으로 바꾸어 작성하여 메소드의 인자값으로 사용
value = [1, 9, 5, 7, 3, 2]

value.sort(by: {
    (s1: Int, s2: Int) -> Bool in
    if s1 > s2 {
        return true
    } else {
        return false
    }
})

//위 예제를 간결화- if 생략
value = [1, 9, 5, 7, 3, 2]
value.sort(by: {(s1: Int, s2: Int) -> Bool in return s1 > s2})
value

//위 예제를 더 간결화- 반환값 표현 생략
value = [1, 9, 5, 7, 3, 2]
value.sort(by: { (s1: Int, s2: Int) in return s1 > s2})
value

//위 예제를 더 간결화- 매개변수 타입 어노테이션 생략
value = [1, 9, 5, 7, 3, 2]
value.sort(by: { s1, s2 in return s1 > s2 })
value

//위 예제를 더 간결화- 매개변수 생략, in 키워드 생략
value = [1, 9, 5, 7, 3, 2]
value.sort(by: { $0 > $1 })
value

//위 예제를 더 간결화- operator func(연산자 함수) 사용
value = [1, 9, 5, 7, 3, 2]
value.sort(by: > )
//:---
/*:
 * __Trailing Closure__
    * 함수의 마지막 인자값이 클로저일 때만 가능
    * 인자값 형식으로 작성하는 대신 함수의 뒤에 꼬리처럼 붙일 수 있는 문법
    * 인자 레이블은 생략
 */
//example of trailing closure
value = [1, 9, 5, 7, 3, 2]
value.sort() { (s1, s2) in
    return s1 > s2
}

//위의 예제를 간결화- 인자값을 감싸는 괄호 생략
value = [1, 9, 5, 7, 3, 2]
value.sort { (s1, s2) in
    return s1 > s2
}   //인자값이 하나일 때만 가능

//인자값이 두개일 때- 인자값을 감싸는 괄호 생략 불가능
func divide(base: Int, success s: () -> Void) -> Int {
    defer {
        s()
    }
    return 100 / base
}

divide(base: 100) { () in
    print("Success")
}   //두번째 인자값에 대한 레이블인 "success s:" 생략가능
    //인자값이 하나 이상이라면 괄호를 생략할 수 없다
    //마지막 인자값만 생략 가능

//마지막 인자값들이 모두 클로저일때 trailing closure 사용 불가
func divide(base: Int, success s: () -> Void, fail f: () -> Void) -> Int {
    guard base != 0 else {
        f()
        return 0
    }
    
    defer {
        s()
        
    }
    return 100 / base
}   //첫번째 인자값: int
    //두번째, 세번째 인자값: ()->Void 형태의 함수 or 클로져

divide(base: 100,
       success: { () in print("success") }
      )
      { () in print("fail") }
    //함수의 마지막 인자값이 클로저일 때 그 마지막 인자값만 trailing 가능하므로
    //첫번째, 두번째 인자값은 모두 괄호()안에 들어감
    //마지막 인자값인 클로져만 괄호 밖에서 꼬리 형태로 입력
    //즉 아래와 같이 입력하면 안된다는 것이다
        //divide(base: 100) { () in
        //    print("success")
        //    } { () in
        //        print("fail")
        //}
//:---
//7.4.4
