//
//  ViewController.swift
//  CompletionBlock
//
//  Created by 진호병 on 2022/03/12.
//

import UIKit
import KRProgressHUD


class ViewController: UIViewController {

    @IBOutlet weak var mainTilte: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("ViewController - viewDidLoad() called")
        
        KRProgressHUD.show()
        sayHi(completion: { result in
            print("컴플레션 블락으로 넘겨받았음 : \(result)")
            KRProgressHUD.showSuccess() // 이게 5초 뒤에 실행됨
            
            self.mainTilte.text = result
        })
        
    }
    
    fileprivate func sayHi(completion: @escaping(String) -> ()){
        print("ViewController - sayHi() called")
        
        
        let secondsToDelay = 5.0
        DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
            //code you want to be delay
            completion("하이 !")
        }
             
    }

    
}

