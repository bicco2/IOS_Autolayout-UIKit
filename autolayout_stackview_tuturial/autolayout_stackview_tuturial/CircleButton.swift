//
//  CircleButton.swift
//  autolayout_stackview_tuturial
//
//  Created by 진호병 on 2022/02/22.
//

import Foundation
import UIKit

class CircleButton: UIButton {
    
    @IBInspectable var cornerRa
}


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
