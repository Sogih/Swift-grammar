//: [Previous](@previous)

/*:
 * __제어전달문__\
    코드의 한 부분에서 다른 부분으로 제어 흐름을 전달하여 코드가 실행되는 순서를 변경해주는 구문
    * __break__
        * switch에서\
        개별 case 블록에 사용되어 전체 switch 구문의 실행을 종료
        * 반복문에서\
        반복 실행 블록에 사용되어 조건식이 false를 반환하기 전에 미리 반복문을 종료
    * __continue__\
    이번 루프는 실행하지 않지만, 전체 반복은 계속 유지됨
    * __fallthrough__\
    switch 내에서 일치된 case 블록의 실행을 다음 case 블록으로 전달
    * __return__\
    함수와 메소드 내에서 값을 반환하면서 실행을 종료하거나 단순히 코드의 실행을 종료
 */
//:---
// break- for
for row in 0...5 {
    if row > 2 {
        break
    }
    print("\(row) was executed!")
}
//:---
// continue- for
for row in 0...5 {
    if row < 2 {
        continue
    }
    print("excuted data is \(row)")
}

//continue- for, if
var text = "This is a swift book for Apple's programming language"
var result = ""

for char in text.characters {
    if char == " " {
        result.append(Character("_"))
        continue
    } else if char == "o" {
        result.append(Character("O"))
        continue
    }
    result.append(char)
}
print(result)
//:---
// 중첩된 반복문에서의 break
for i in 1...5 {
    for j in 1...9 {
        if (j==3) {
            break
            // 외부 반복문에는 영향을 미치지 못한다
        }
        print("\(i) X \(j) = \(i*j)")
    }
}

// 중첩된 반목분에서 한번의 break로 외부 루프까지 종료 하려고 할 때
var loopFlag = true

for i in 1...5 {
    for j in 1...9 {
        if (j==3) {
            loopFlag = false
            break
        }
        print("\(i) X \(j) = \(i*j)")
    }
    if (loopFlag == false) {
        break
    }
}

// 레이블을 사용해서 중첩된 반복문에서 내부 제어 구문으로 외부 구문까지 제어하는 방법
outer : for i in 1...5 {
    // 레이블 이름 지정
    inner : for j in 1...9 {
        if (j==3) {
            break outer
        }
        print("\(i) X \(j) = \(i*j)")
    }
}
//: [Next](@next)
