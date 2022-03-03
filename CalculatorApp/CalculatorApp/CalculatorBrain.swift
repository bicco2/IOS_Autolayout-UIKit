import Foundation

class CalculatorBrain{ //base class
    private var accumulator: Double = 0.0 //결과 누적 변수
    
    func setOperand(operand: Double){
        accumulator = operand
    }
    
     
    
    func performOperation(symbol:String){
        switch symbol{
            case "π" : accumulator = M_PI
            case "⎷" : accumulator = sqrt(accumulator)
            default : break
        }
    }
    
    var result: Double{
        get{
            return accumulator
        }
    }
}
