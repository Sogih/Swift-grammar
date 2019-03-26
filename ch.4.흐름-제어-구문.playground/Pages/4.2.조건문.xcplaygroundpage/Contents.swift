//: [Previous](@previous)
/*:
 * 조건문
    1. if
    2. guard
    3. switch
 */
//:---
let adult = 19
var age = 27
var gender = "M"

//if
if age < adult {
    print("당신은 미성년자!")
}

//if~else
if age < adult {
    print("당신은 미성년자!")
} else {
    print("당신은 성년자!")
}

//if 중첩
if age < adult {
    if gender == "M" {
        print("남자 미성년자입니다.")
    } else {
        print("여자 미성년자입니다.")
    }
} else {
    if gender == "M" {
        print("남자 성년자입니다.")
    } else {
        print("여자 성년자입니다.")
    }
}

//else if
if gender == "M" {
    print("남자입니다.")
} else if gender == "W" {
    print("여자입니다.")
} else {
    print("남자와 여자 어느 쪽에도 속하지 않습니다.")
}
//:---
/*:
 * guard 구문
    * 조건을 만족하지 않는 상황에서 구문을 조기 종료하기 위한 목적
    * 따라서 return, break가 반드시 포함되어야
    * guard는 if로 대체할 수 있다
        1. if~else: 조건을 하크하되 다른 실행 흐름을 이어나가고 싶은 경우
        2. guard: 조건을 체크하여 다른 실행 흐름을 종료하고 싶은 경우
 */
func divide(base: Int) {
    
    guard base != 0 else {
    //guard구문에서 else는 필수
    //하지만 조건식이 참일 때 실행되는 블록이 없다
        print("연산할 수 없습니다")
        return
        //return 구문이 실행되면 이후의 코드가 남아있더라도 함수 종료
    }
    
    let result = 100 / base
    print(result)
}
divide(base: 0)
divide(base: 50)
//:---
/*:
 #availavle: OS 버전 별로 구문을 분리해야 할 때
 */
if #available(iOS 9, OSX 10.10, watchOS 1, *) {
    // iOS 9용 API 구문 또는 OS X 10.10용 API구문, watchOS 1용 API 구문
    // 플랫폼 이름과 버전 사이는 공백으로 구분
    // 마지막에 *로 마감하여 인자값 입력이 끝났음을 선언
} else {
    // API를 사용하지 못했을 때에 대한 처리
}
//:---

//switch 나열된 패턴들을 순서대로 비교하다가 일치하는 첫 번째 패턴의 코드 블록을 실행한다.
let val = 2
switch val {
    case 1 :
        print("일치한 값은 1입니다.")
    case 2 :
        print("일치한 값은 2입니다.")
    case 3 :
        print("일치한 값은 3입니다.")
    default :
        print("어느 패턴과도 일치하지 않습니다")
}
    // 일치하는 비교 패턴이 있을 경우 해당 블록의 실행 코드를 처리하고,
    // 더이상의 비교 없이 전체 switch문을 종료
    // 모든 경우에 대해서 케이스를 지정해줘야 하고
    // 놓치는 케이스가 있는 경우에는 디폴트를 반드시 선언해줘야 함

//switch- fallthrough
let sampleChar : Character = "a"
switch sampleChar {
    case "a" :
        fallthrough
    case "A" :
        print("글자는 A 입니다")
    default :
        print("일치하는 글자가 없습니다")
}   //fallthrough 구문이 사용된 case 블록은 비교 패턴과 일치할 경우 인접한 case 블록으로 실행 흐름을 전달
    //실행 흐름을 전달받은 case 블록은 비교 패턴의 일치 여부와 상관없이 작성된 구문을 실행한 후 switch 종료

//switch 다중 비교 패턴
var value = 3
switch value {
    case 0, 1:
        print("0 또는 1입니다.")
    case 2, 3:
        print("2 또는 3입니다.")
    default :
        print("default입니다.")
}

// switch 비교 패턴이 부분 일치하는 경우
var value_2 = (2,3)
switch value_2 {
    case let (x, 3) :
        print("튜플의 두 번째 값이 3일 때 첫 번째 값은 \(x)입니다.")
    case let (3, y) :
        print("튜플의 첫 번째 값이 3일 때 두 번째 값은 \(y)입니다.")
    case let (x, y) :
        print("튜플의 값은 각각 \(x), \(y)입니다.")
}   // 튜플 내부의 아이템이 비교 대상과 부분적으로 일치하더라도
    // 전체가 일치하는 것으로 간주한다
    // 이 때 일치하지 않는 나머지 부분을 사웃나 변수화 하여 사용할 수 있다

// switch 비교 패턴을 range로 지정하기
var passtime = 1957
switch passtime {
    case 0..<60 :
        print("방금 작성된 글입니다")
    case 60..<3600 :
        print("조금 전 작성된 글입니다")
    case 3600..<86400 :
        print("얼마 전 작성된 글입니다")
    default :
        print("예전에 작성된 글입니다.")
}

// switch- 튜플 형식의 데이터에 대해 범위 연산자를 사용한 패턴 비교방식
var value_3 = (2,3)
switch value_3 {
    case (0..<2, 3) :
        print("범위 A에 포함되었습니다.")
    case (2..<5, 0..<3) :
        print("범위 B에 포함되었습니다.")
    case (2..<5, 3..<5) :
        print("범위 C에 포함되었습니다.")
    default :
        print("범위 D에 포함되었습니다.")
}

// switch - where 구문 추가
var point = (3,-3)
switch point {
case let (x,y) where x == y :
    // let: 변수 point를 x,y에 할당하고,
    // where: 할당한 (x,y)에 대한 조건 비교
    print("\(x)과 \(y)은 x==y 선 상에 있습니다.")
case let (x,y) where x == -y :
    print("\(x)과 \(y)은 x==-y선 상에 있습니다")
case let (x,y) :
    print("\(x)과 \(y)은 일반 좌표상에 있습니다.")
}

//: [Next](@next)
