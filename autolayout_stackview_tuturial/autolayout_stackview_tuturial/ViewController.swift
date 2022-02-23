import UIKit


//CircleButton
@IBDesignable
class view :UIView {
    @IBInspectable var borderColor: UIColor {
        get{
            let color = self.layer.borderColor ?? UIColor.clear.cgColor
            return UIColor(cgColor: color)
        }
        set{
            self.layer.borderColor = newValue.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get{
            return self.layer.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get{
            return self.cornerRadius
        }
        set{
            self.cornerRadius = newValue
        }
    }
}


class ViewController: UIViewController {
    
    
    @IBOutlet weak var inputNum: UILabel!
    
    @IBOutlet var phoneNumberBtns: [UIButton]!
    
    @IBOutlet weak var phoneCallBtn: UIButton!
    
    var phoneNumberString = ""{
        didSet{
            DispatchQueue.main.async {[weak self] in //메모리를 계속 잡고 있는 걸 막기 위해서 weak self로 약한 참조 걸어줌
                guard let self = self else {return}      // 셀프 자체에 옵셔널을 해제 해준다 .
                self.inputNum.textColor = .black
                //or self?.inputNum.text = self?.phoneNumberString
                self.inputNum.text = self.phoneNumberString // phoneNUmberString에 self를 붙이는 이유 : {}가 하나 더 생김
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for btnItem in phoneNumberBtns{//각 요소에 적용
            btnItem.addTarget(self, action: #selector(onNumberBtnClicked(sender:)), for: UIControl.Event.touchUpInside)
        }
        
        phoneCallBtn.addTarget(self, action: #selector(onPhoneCallBtnClicked(_:)), for: .touchUpInside)
        
        
    }

    @objc fileprivate func onNumberBtnClicked(sender: UIButton){ //버튼 클릭했을 때 발동하는 이벤트 만들어 주고
        guard let inputString = sender.titleLabel?.text else{return} //sender = 버튼, titleLable = 버튼이 가진 text ,옵셔널 왜함?
        phoneNumberString.append(inputString)
    }

    @objc fileprivate func onPhoneCallBtnClicked(_ sender: UIButton){
        phoneNumberString.removeAll()
    }
}
