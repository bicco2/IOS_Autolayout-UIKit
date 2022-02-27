
import Foundation
import UIKit


@IBDesignable
class InputLabel: UILabel {
    @IBInspectable var borderColor: UIColor? {
        get{
            return UIColor(cgColor: layer.borderColor!)
        }
        set{
            layer.borderColor = newValue?.cgColor
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
}
