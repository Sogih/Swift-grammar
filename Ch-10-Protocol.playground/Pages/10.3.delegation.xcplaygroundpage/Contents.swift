/*:
 ## delegation
 ---
 "네가 누군지 난 알 필요 없다. 다만 너는 내가 호출할 메소드를 구현하고 있기만 하면 된다."\
 델리게이트 패턴 : 특정 기능을 다른 객체에 위임하고, 그에 따라 필요한 시점에서 메소드의 호출만 받는 패턴
*/
//연료의 양에 다라 필요한 알람을 전달하는 프로토콜
protocol FuelPumpDelegate {
    func lackFuel()
    func fullFuel()
}

    //연료펌프 클래스
class FuelPump {
    var maxGage: Double = 100.0
    var delegate: FuelPumpDelegate? = nil
    
    var fuelGage: Double {
        didSet {
            //프로퍼티 옵저버 - 연료 눈금이 변화할 때마다 적정 수치를 검사
            if oldValue < 10 {
                //연료가 부족해지면 델리게이트의 lackFuel 메소드를 호출한다.
                self.delegate?.lackFuel()
            } else if oldValue == self.maxGage {
                //연료가 가득차면 델리게이트의 fullFuel 메소드를 호출한다.
                self.delegate?.fullFuel()
            }
        }
    }
    init(fuelGage: Double = 0) {
        self.fuelGage = fuelGage
    }
    //연료펌프를 가동한다.
    func startPump(){
        while (true) {
            if (self.fuelGage > 0) {
                self.jetFuel()
            } else {
                break
            }
        }
    }
    
    //연료를 엔진에 분사한다. 분사할 때마다 연료 게이지와 눈금은 내려간다
    func jetFuel(){
        self.fuelGage -= 1
    }
}



//: ## 연료펌프 클래스를 이동수단에 장착
//:---
/*:
이동수단이 되는 클래스는 반드시 FuelPumpDelegate 프로토콜을 구현해야 한다. 그래야 연료펌프 클래스의 delegate 프로퍼티에 자신을 할당할 수 있는 타입이 될 수 있기 때문이다.
 */
class Car: FuelPumpDelegate {
    var fuelPump = FuelPump(fuelGage: 100)
        //fuelPump 프로퍼티에 FuelPump 클래스의 인스턴스를 할당
    
    init() {
        self.fuelPump.delegate = self
    }   //연료펌프의 델리게이트 프로퍼티를 자신으로 설정
    
    //fuelPump가 호출하는 메소드
    func lackFuel() {
        //연료를 보충한다
    }
    
    //fuelPump가 호출하는 메소드
    func fullFuel() {
        //연료 보충을 중단한다
    }
    
    //자동차에 시동을 건다
    func start() {
        fuelPump.startPump()
    }
}
