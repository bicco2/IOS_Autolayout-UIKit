import UIKit

class testViewController: UIViewController {
 

    @IBOutlet weak var testBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //상단 네비게이션 바를 숨김 처리
        self.navigationController?.isNavigationBarHidden = true
        
        
    }


    @IBAction func testBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    
    }
    
      
    
}

