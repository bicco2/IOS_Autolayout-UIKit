//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 진호병 on 2022/02/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputNum: UILabel!
    //끝에 ?가 오면 밑에 inputNum들에게 ! 를 붙여줘야한다. 끝에 !는 왜 안붙이냐? >> 강제적으로 값을 부여해서 값이 무조건 있게 만듦
    
    var userIsInTheMiddleOfTyping = false //터치 안할때는 항상 false
    
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping{
            let textCurrentlyInDisplay = inputNum.text!
            inputNum.text = textCurrentlyInDisplay + digit
        } else {
            inputNum.text = digit
        }
        
        userIsInTheMiddleOfTyping = true
    }
    
    var inputValue: Double{
        get{
            return Double(inputNum.text!)! //여기서 !를 쓰는 이유는 inputNum.text!가 항상 double를 리턴 하는게 아니여서 값을 모를 수가 있기 때문이다 . 따라서 !를 삽입해 강제 추출을 함
        }
        set{
            inputNum.text =  String(newValue) //newValue는 누군가 set한 double타입의 값임
            //그리고 inputNum.text는 string이기 떄문에 형변환ㄱ ㄱ
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathmaticalSymbol = sender.currentTitle{
            if mathmaticalSymbol == "π"{
                inputValue = M_PI
                // == inputNum.text = String(M_PI)
            } else if mathmaticalSymbol == "⎷" {
                inputValue = sqrt(inputValue)
            }
        }
    }
    
}

//    var phoneNumberString = ""{
//        didSet{
//            DispatchQueue.main.async {[weak self] in //메모리를 계속 잡고 있는 걸 막기 위해서 weak self로 약한 참조 걸어줌
//                guard let self = self else {return}      // 셀프 자체에 옵셔널을 해제 해준다 .
//                self.inputNum.textColor = .black
//                //or self?.inputNum.text = self?.phoneNumberString
//                self.inputNum.text = self.phoneNumberString // phoneNUmberString에 self를 붙이는 이유 : {}가 하나 더 생김
//            }
//        }
//    }
