//
//  BorderedButton.swift
//  EggTimer
//
//  Created by Andrii Shkliaruk on 28.08.2021.
//

import UIKit

class BorderedButton : UIButton {
    
    //Button border width
    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    
    //Button border color
    @IBInspectable var borderColor: UIColor? {
        set { layer.borderColor = newValue?.cgColor }
        get { return layer.borderColor?.UIColor }
    }
    
    //Button corner radius
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius  }
    }
}


//Convert CGColor object to UIColor with parameter
extension CGColor {
     fileprivate var UIColor: UIKit.UIColor {
        return UIKit.UIColor(cgColor: self)
    }
}
