import Foundation

//func multiply(op1 : Double, op2 : Double) -> Double {
//    return op1 * op2
//}

class CalculatorBrain{ //base class
    private var accumulator: Double = 0.0 //결과 누적 변수
    
    func setOperand(operand: Double){
        accumulator = operand
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
//        "*" : Operation.BinaryOperation({(op1 : Double, op2 : Double) -> Double in //클로져 이용 in 추가 및 { 괄호 앞으로 옮김
//            return op1 * op2
//        }),
//        "*" : Operation.BinaryOperation({(op1 , op2) in return op1 * op2}),
//        "*" : Operation.BinaryOperation({($0 , $1) in return $0 * $1}),
        //클로저 지리네
        "*" : Operation.BinaryOperation({ $0 * $1 }),
        "%" : Operation.BinaryOperation({ $0 / $1 }),
        "+" : Operation.BinaryOperation({ $0 + $1 }),
        "-" : Operation.BinaryOperation({ $0 - $1 }),
        "=" : Operation.Equals
    ]
     
    // enum은 메소드를 가질 수 있다. 하지만 변수를 가질 수 없다 .(계산 변수 ㅇ 저장변수 x) 또한 상속도 불가하다.
    private enum Operation {
        case Constant(Double) //여기서 (double)은 연관값을 말하는데 이게 있어야 값을 받을 수 있음
        case UnaryOperation((Double) -> Double) //이게 단항 연산의 연관 값인 함수임 ((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals

    }
    
    func performOperation(symbol:String){
        if let operation = operations[symbol]{
            switch operation { //왜 여기 switch는 default가 필요 없나 => operation 자체에 값이 4개만 존재하기 떄문에
                case .Constant(let value):
                    accumulator = value
                case .UnaryOperation(let funcSqrt):
                    accumulator = funcSqrt(accumulator)
                case .BinaryOperation(let function): //function >> 이게 연산기호에 따른 계산 함수를 뜻함 따라서 binaryFunction: function 이게 그 함수임
                    executePendingBinaryOperation()
                    pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
                case .Equals:
                    executePendingBinaryOperation()
            }
        }
    }
    
    private func executePendingBinaryOperation(){ //equals의 기능을 함수로 빼서 x 할때마다 계산이 되는 형식으로 만듦 
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo{
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    //흐름 설명
    //1.var operations 에서 어떤 버튼을 누르는 지에 따라 "어떤 기능"을 할지 틀을 만든다 (ex. π 선택)
    //2.enum Operation을 통해 "어떤 기능"이 '뭘 수행'할지 정해준다. (ex. 연관값으로 double을 넘겨줌을 알려줌)
    //3.func performOperation 에서 '뭘 수행'에 대한 상세 코드를 작성 한다. (ex. 그 연관 값을 accumulator 즉 계산기 화면에 설정== 업데이트)
    
    var result: Double{
        get{
            return accumulator
        }
    }
}

