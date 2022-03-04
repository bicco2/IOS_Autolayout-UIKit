import Foundation

class CalculatorBrain{ //base class
    private var accumulator: Double = 0.0 //결과 누적 변수
    
    func setOperand(operand: Double){
        accumulator = operand
    }
    
    var operations: Dictionary<String, Double> = [
        "π" : M_PI,
        "e" : M_E,
        "√" : sqrt,
        "cos" : cos
    ]
     
    // enum은 메소드를 가질 수 있다. 하지만 변수를 가질 수 없다 .(계산 변수 ㅇ 저장변수 x) 또한 상속도 불가하다.
//    enum Operation {
//        case Constant
//        case UnaryOperation
//        case BinaryOperation
//        case Equals
//
//    }
    
    func performOperation(symbol:String){
        if let constant = operations[symbol]{//if를 사용함으로써 옵셔널을 방지할 수 있음 if 안쓰면 밑에 constant에 ! 써야함
            accumulator = constant
        }
    }
    
    var result: Double{
        get{
            return accumulator
        }
    }
}


//⎷
