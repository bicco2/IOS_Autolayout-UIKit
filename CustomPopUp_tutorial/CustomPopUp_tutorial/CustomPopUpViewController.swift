//
//  CustomPopUpViewController.swift
//  CustomPopUp_tutorial
//
//  Created by 진호병 on 2022/03/11.
//


import UIKit

class CustomPopUpViewController: UIViewController{
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var subscribeBtn: UIButton!
    @IBOutlet weak var bgBtn: UIButton!
    
    var subscribeBtnCompletionClosure: (() -> Void )? //아무 행동도 안하지만 발생된건 알려준다 >> 비동기 처리임
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewController - viewDidLoad() called")
        
        
        
    }
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
}
