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
    
    @IBAction func onSubscribeBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onSubscribeBtnClicked() called")
        
        self.dismiss(animated: true, completion: nil)
        
        //  컴플래션 블럭 호출
        if let subscribeBtnCompletionClosure = subscribeBtnCompletionClosure {
            //메인에 알린다.
            subscribeBtnCompletionClosure()
        }
    }
    
    
    @IBAction func chatBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - chatBtnClicked () called")
        myPopUpDelegate?.onChatBtnClicked() //얘로 리모콘 버튼 누름
        
    }
    
    
}
