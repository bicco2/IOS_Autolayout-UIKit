//
//  MYCircleView.swift
//  autolayout_code_tutorial_01
//
//  Created by 진호병 on 2022/02/23.
//

import Foundation
import UIKit

class MyCircleView : UIView{
    
    override func layoutSubviews() {
        super.layoutSubviews() // 무조건 해줘야함
        print("MyCircleView - layoutSubViews() called")
        self.layer.cornerRadius = self.frame.height / 2
        
    }
}
