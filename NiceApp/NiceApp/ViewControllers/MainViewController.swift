//
//  ViewController.swift
//  NiceApp
//
//  Created by 진호병 on 2022/02/27.
//

import UIKit
import Lottie


class MainViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "빠르게 가자"
        label.font = UIFont.boldSystemFont(ofSize: 70)
        return label
    }()

    let animationView : AnimationView = {
        let animView = AnimationView(name: "97423-loading-star-waiting")
        animView.frame = CGRect(x:0,y:0, width: 400, height: 400)
        animView.contentMode = .scaleAspectFill //스케일에 맞도록 다 채우겠따.
        return animView
    }()
    
    //뷰가 생성되었을 떄
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //위에서 만든 animatinoVIew를 추가하는 것 view에
        view.backgroundColor = .black
        view.addSubview(animationView)
        animationView.center = view.center
        
        
        //애니메이션 실행
        animationView.play{ (finish) in// in == 콜백함수
            //animation이 끝나면 밑 코드가 실행됨
            print("애니메이션이 끝났다.")
            
            self.view.backgroundColor = .white
            self.animationView.removeFromSuperview() //애니메이션이 끝나고 나면 슈퍼뷰에 추가했던 애니메이션 뷰를 지워주는 코드 
            
            self.view.addSubview(self.titleLabel)
            
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
                
        }
      
    }


}

