//
//  ViewController.swift
//  CustomPopUp_tutorial
//
//  Created by 진호병 on 2022/03/11.
//

import UIKit
import WebKit

class ViewController: UIViewController, PopUpDelegate {
    

    @IBOutlet weak var createPopUpBtn: UIButton!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var greet: UILabel!
    @IBOutlet weak var backToHomeBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //제스처 뒤로가기 활성화
        self.myWebView?.allowsBackForwardNavigationGestures = true
        
    }

    
    
    @IBAction func onCreatePopUpBtnClicked(_ sender: UIButton) {
        
        print("ViewController - onCreatePopUpBtnClicked() called")
        
        //스토리 보드 가져오기 초기화(popup 스토리보드임 )
        let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
        
        //스토리보드를 통해 뷰컨트롤러 가져오기(스토리보드의 아이디를 설정해서 가져오는 것임)
        let customPopUpVC = storyboard.instantiateViewController(withIdentifier: "AlertPopUpVC") as! CustomPopUpViewController //as 는 타입 캐스팅임 (자료형 확정 )
        
        //팝업 효과 설정(이거 안하면 기본 팝업 설정효과로 됨) ==뷰 컨트롤러가 보여지는 스타일
        customPopUpVC.modalPresentationStyle = .overCurrentContext
        
        //팝업 == 뷰 컨트롤러가 사라지는 스타일
        customPopUpVC.modalTransitionStyle = .crossDissolve
        
        customPopUpVC.subscribeBtnCompletionClosure = { //이게 호출됐다는건 중심이 메인스토리보드로 옮겨간걸 의미한다 .
            print("컴플레션 블럭(클로져)이 호출되었다. ")
            let myChannelUrl = URL(string: "https://bicco2.tistory.com/")
            self.myWebView.load(URLRequest(url: myChannelUrl!))
            self.greet.isHidden = true
        }
        
        //위에서 설정한 alertPopUpVC 를 보여주도록 하는 코드
        self.present(customPopUpVC, animated: true, completion: nil)
        
        
        
    }
    @IBAction func onBackToHomeBtnClicked(_ sender: UIButton) {
        self.greet.isHidden = false
    }
    
    //MARK: - PopUpDelegate methods
    func onChatBtnClicked() { //PopUpDelegate에서 만든 메소드 자동 연결함
        print("ViewController - onChatBtnClicked()  called ")
    }

    
}

