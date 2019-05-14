//: [Previous](@previous)
/*:
 set: 같은 타입의 서로 다른 값을 중복없이 저장
 ---
 */
//집합의 정의
    //초기값을 사용하여 바로 정의
        var genres : Set = ["Classic", "Rock", "Balad"]
            //집합을 정의할 때 사용하는 구조체 Set을 빼버리면 배열로 인식해버린다
            //타입 어노테이션
            //초기값으로 텅 빈 배열을 사용하여 집합을 저장해야 한다면, 타입 어노테이션에서 아이템 타입을 작성해 주어야 한다
            //var g : Set<String> = [ ]
            //var genres : Set<String> = ["Classinc", "Rock", "Balad"]
    //초기값을 사용하지 않은 빈 집합을 정의
        var genres_2 = Set<String>()
            //빈 집합을 정의
        genres_2.insert("Classic")
        genres_2.insert("Rock")
        genres_2.insert("Balad")
            //집합에 아이템을 추가

//빈 집합인지 체크
if genres.isEmpty {
    print("집합이 비어있습니다.")
} else {
    print("집합에는 현재 \(genres.count) 개의 아이템이 저장되어 있습니다.")
}
//:---
//집합 순회 탐색
for g in genres {
    print("\(g)")
}
//:---
//집합의 동적 추가
genres
genres.insert("Jazz")
genres.insert("Rock")
    //중복된 아이템은 추가되지 않는다
genres.insert("Rock")
genres

//집합의 동적 삭제
if let removedItem = genres.remove("Rock") {
    print("아이템 \(removedItem)의 삭제가 완료되었습니다")
} else {
    print("삭제할 값이 집합에 추가되어 있지 않습니다.")
}   //remove메소드: 일치하는 아이템을 찾아서 삭제한다.
    //있으면 해당 아이템을, 없으면 nil을 반환한다.
genres.remove("R&B")
genres.remove("Jazz")
genres.removeAll()
    //모든 아이템 삭제

//isEmpty 메소드
if genres.isEmpty {
    print("모든 아이템이 삭제되었습니다")
} else {
    print("아직 \(genres.count)개의 아이템이 남아있습니다.")
}

//contains 메소드
if genres.contains("Rock") {
    print("Rock 아이템이 저장되어 있습니다.")
} else {
    print("Rock 아이템이 저장되어 있지 않습니다.")
}
//:---
/*:
 * 집합 연산
     * intersection(_:): 교집합
     * symmetricDiffernce(_:): 합집합에서 교집합을 뺀것
     * union(_:): 합집합
     * subtract(_:): a - a교집합b
 */
//기본 집합 연산
var oddDigits : Set = [1, 3, 5, 7, 9] // 홀수 집합
let evenDigits : Set = [0, 2, 4, 6, 8] // 짝수 집합
let primeDigits : Set = [ 2, 3, 5, 7] // 소수 집합

oddDigits.intersection(evenDigits).sorted() // 원래의 각각 집합은 유지됨
oddDigits.symmetricDifference(primeDigits).sorted() // ''
oddDigits.union(evenDigits).sorted() // ''
oddDigits.subtract(primeDigits) // 왼쪽 집합의 아이템을 직접 제거함
oddDigits.sorted()

/*:
 * 부분집합과 포함관계 판단 연산
     * `A.isSubset(of: B)`: A가 B에 포함되는지
     * `A.isSuperset(of: B)`: A가 B를 포함하는지
     * `A.isStrictSubset(of: B)`: A가 B에 포함되는지, 일치는 포함하지 않는 것으로 본다
     * `A.isDisjoint(with: D)`: A와 B의 공통된 값이 '없는지'
 */
//example
let A : Set = [1, 3, 5, 7, 9]
let B : Set = [3, 5]
let C : Set = [3, 5]
let D : Set = [2, 4, 6]

B.isSubset(of: A)
A.isSuperset(of: B)
C.isStrictSubset(of: A)
C.isStrictSubset(of: B)
A.isDisjoint(with: D)

// 배열을 집합으로 변환하여 중복 아이템 제거하기
var a = [4, 2, 5, 1, 7, 4, 9, 11, 3, 5, 4] //배열

let b = Set(a) //집합
a = Array(b) //중복이 제거된 배열
    //위의 두 줄을 한 줄의 구문으로 줄일 수 있다
    //a = Array(set(a))
//: [Next](@next)
