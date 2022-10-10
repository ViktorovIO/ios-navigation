//
//  CustomButton.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 09.10.2022.
//

import UIKit

class CustomButton: UIButton {
    private var tapClosure: (() -> ())? = nil
    
    init(customTitle: String, backgroundColor: UIColor, frame: CGRect?) {
        super.init(frame: .zero)
        
        if frame != nil {
            self.frame = frame!
        }
        
        self.setTitle(customTitle, for: .normal)
        self.backgroundColor = backgroundColor
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setLayerShadow(
        shadowColor: CGColor,
        shadowOffset: CGSize,
        shadowOpacity: Float,
        shadowRadius: CGFloat,
        masksToBounds: Bool
    ) {
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.masksToBounds = masksToBounds
    }
    
    func setTapClosure(tapClosure: @escaping (() -> ())) {
        self.tapClosure = tapClosure
    }
    
    @objc
    private func buttonTapped() {
        if self.tapClosure != nil {
            self.tapClosure!()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
