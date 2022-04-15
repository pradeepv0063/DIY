//
//  NavButton.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import UIKit

@IBDesignable
class NavButton: UIButton {
    
    var isNextBtn2: Bool = false
    @IBInspectable var isNextBtn: Bool {
        set {
            isNextBtn2 = newValue
            customInit()
        }
        
        get {
            return isNextBtn2
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    override func prepareForInterfaceBuilder() {
        customInit()
    }
    
    func customInit() {
        
        var title: String
        var imageName: String
        var placement: NSDirectionalRectEdge
        if isNextBtn {
            title = "Next"
            imageName = "arrow.right"
            placement = .trailing
        } else {
            title = "Back"
            imageName = "arrow.left"
            placement = .leading
        }
        
        var container = AttributeContainer()
        container.font = UIFont.boldSystemFont(ofSize: 20)
        
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.buttonSize = .large
        config.attributedTitle = AttributedString(title, attributes: container)
        config.image = UIImage(systemName: imageName)
        config.imagePadding = 10
        config.imagePlacement = placement
        config.cornerStyle = .large
        config.buttonSize = .large

        configuration = config
    }
}
