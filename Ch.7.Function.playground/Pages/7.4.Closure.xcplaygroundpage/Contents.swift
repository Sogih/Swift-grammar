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
/*:
 * __@escaping__
    * 인자값으로 전달된 클로저를 저장해 두었다가, 나중에 다른 곳에서도 실행할 수 있도록 해주는 속성
 */
//예제
func callback(fn: () -> Void) {
    fn()
}   //callback: 매개변수 fn를 통해 전달된 클로저를 함수 내부에서 실행

callback {
    print("Closure has been executed")
}   //{~}: 클로저

    //func callback(fn: () -> Void) {
    //    let f = fn //클로저를 상수 f에 대입
    //    f() //대입된 클로저를 실행
    //}   //오류: non-escaping 파라미터인 'fn'은 오직 직접 호출하는 것만 가능
/*:
 * non-escape(탈출불가)
    * 함수의 인자값으로 전달된 클로저는 non-escape의 성격을 가진다
    * 해당 클로저를 함수 내에서 직접 실행을 위해서만 사용해야 한다
    * 따라서 함수 내부라도 변수(상수)에 대입할 수 없다
    * 변수(상수)에 대입하면 클로저가 함수 외부에서도 실행할 수 있기 때문이다
    * 중첩된 내부 함수에도 사용할 수 없다
    * 컴파일러가 코드를 최적화하는 과정에서의 성능향상 기대
    * 클로저가 탈출 불가하다 <=> 컴파일러의 메모리 관리가 효율적이다
    * 탈출불가 클로저 내에서는 self키워드를 사용할 수 있다
        * 함수가 리턴되기 전에 호출될 것이 명확하기 때문
 */
//예제- 함수의 인자값으로 전달된 클로저는 중첩된 내부 함수에도 사용할 수 없다
    //func callback_2(fn: () -> Void) {
    //    func innerCallback() {
    //        fn()
    //    }
    //}
/*:
 * __@escaping__ 속성
    * 클로저를 변수(상수)에 대입해야 하는 경우
    * 클로저를 중첩 함수 내부에서 사용해야 하는 경우
    * non-escape을 해제
 */
//@escaping 속성 적용
func callback_2(fn: @escaping () -> Void) {
    let f = fn //클로저를 상수에 할당하는것이 가능해졌다
    f() //클로저를 할당받은 상수를 실행
}   //함수타입 앞에 '@escaping'을 넣어준다

callback {
    print("Closure has been executed")
}
//:---
/*:
 * __@autoclosure__
    * 인자값으로 전달된 일반 구문이나 함수 등을 클로저로 wrapping
    * 인자값을 '{}'형태가 아니라 '()'형태로 사용할 수 있음
        * 인자값을 직접 클로저 형식으로 넣어줄 필요가 없기 때문
 */
//example- @autoclosure 속성을 적용하지 않은 경우
func condition(stmt: () -> Bool) {
    //ㄴ함수의 인자값으로 '인자값이 없고 반환값이 Bool형인 클로저'를 받는다
    if stmt () == true {
        print("result is true")
    } else {
        print("result is false")
    }
}   //함수 정의

condition(stmt: {
    4 > 2
})  //ㄴ함수 실행- 방법1- 일반 구문

condition{
    4 > 2
}   //ㄴ함수 실행- 방법2- 클로저 구문
    //ㄴ클로저 경량화 문법 사용
        //클로저 경량화 과정ㄱ
            // step1: 경량화x, 클로저 전체 구문
            condition { () -> Bool in
                return (4 > 2)
            }
            // step2: 클로저 타입 선언 생략
            condition {
                return (4 > 2)
            }
            // step3: 클로저 반환구문 생략
            condition {
                4 > 2
            }

//@autoclosure를 적용한 경우
func condition_2(stmt: @autoclosure () -> Bool) {
    if stmt() == true {
        print("result is true_2")
    } else {
        print("result is false_2")
    }
}   //ㄴ함수 선언

condition_2(stmt: ( 4 > 2 ))
    //ㄴ함수 실행
    //ㄴ@autoclosure 속성의 영향으로 더이상 일반 클로저를 인자값으로 사용할 수 없음
    //ㄴ트레일링 클로저 구문도 사용 불가
    //ㄴ클로저가 아니라 그 안에 들어가는 내용만 인자값으로 넣어준다
    //ㄴ컴파일러가 자동으로 클로저 형태로 감싸서 처리함
        //<=>인자값을 {}가아닌 ()형태로 사용할 수 있게 해준다

//지연된 실행
var arrs = [String]() //빈 배열

func addVars(fn: @autoclosure () -> Void) {
    arrs = Array(repeating: "", count: 3)
    //ㄴ배열 요소를 3개까지 추가하여 초기화
    fn()
    //ㄴ인자값으로 전달된 클로저 실행
}

    //arrs.insert("KR", at: 1)
        //ㄴ구문1-오류: 배열이 [1]까지 확장되어있지 않기 때문 (함수가 실행되기 전에는 배열이 초기 빈 배열 그대로)
    addVars(fn: arrs.insert("KR", at: 1))
        //ㄴ구문2-오류x: 지연된 실행
