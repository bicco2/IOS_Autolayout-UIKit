//
//  CustomPopUpViewController.swift
//  CustomPopUp_tutorial
//
//  Created by 진호병 on 2022/03/11.
//


import UIKit

class CustomPopUpViewController: UIViewController{
    
    @IBOutlet weak var profileImg: UIImageView!
    
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var subscribeBtn: UIButton!
    @IBOutlet weak var bgBtn: UIButton!
    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var blogBtn: UIButton!
    
    
    var subscribeBtnCompletionClosure: (() -> Void )? //아무 행동도 안하지만 발생된건 알려준다 >> 비동기 처리임
    
    var myPopUpDelegate : PopUpDelegate? // 이걸로 리모컨 만들고
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewController - viewDidLoad() called")
        
        profileImg.layer.cornerRadius = 20
        contentView.layer.cornerRadius = 30
        
        
    }
    
    
    //MARK: - IBActions
    @IBAction func onBgBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onBgBtnClicked() called")
        
        //현재 창을 닫아주는 코드 completion : 창이 닫아질때 행동할 메소드를 말함
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSubscribeBtnClicked(_ sender: UIButton) { //🍎컴플레션 블럭 클로져 방식
        print("CustomPopUpViewController - onSubscribeBtnClicked() called")
        
        self.dismiss(animated: true, completion: nil)
        
        //  컴플래션 블럭 호출
        if let subscribeBtnCompletionClosure = subscribeBtnCompletionClosure {
            //메인에 알린다.
            subscribeBtnCompletionClosure()
        }
    }
    
    
    @IBAction func chatBtnClicked(_ sender: UIButton) { //🍎프로토콜 델리겟 방식
        print("CustomPopUpViewController - chatBtnClicked () called")
        
        myPopUpDelegate?.onChatBtnClicked() //얘로 리모콘 버튼 누름 뷰컨에서 수신해서 거기서 실행 단 수신기와 연결기 되어있어야한다. 
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func onBlogBtnClicked(_ sender: UIButton) { //🍎노티피케이션 센터 방식
        print("CustomPopUpViewController - onBlogBtnClicked() called")
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificatrionName), object: nil)
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
}
