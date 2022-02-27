import UIKit

class RegisterViewController: UIViewController {
 
    @IBOutlet weak var btnToLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //상단 네비게이션 바를 숨김 처리
        self.navigationController?.isNavigationBarHidden = true
        
        
    }


    @IBAction func btnToLoginAction(_ sender: UIButton) {
        //네비게이션 뷰 컨트롤러를 팝 한다. //보니까 이전 단계로 간다 .
        self.navigationController?.popViewController(animated: true)
    }
    
}

