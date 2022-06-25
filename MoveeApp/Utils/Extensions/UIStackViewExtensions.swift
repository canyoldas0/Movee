//
//  UIStackViewExtensions.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 24.06.2022.
//

import UIKit

extension UIStackView {
    
    func addHorizontalSeperator(after: UIView) {
        guard let index = self.arrangedSubviews.firstIndex(of: after) else {return}
        let seperatorLabel = UILabel()
        seperatorLabel.text = "|"
        seperatorLabel.textColor = .almostBlack
        seperatorLabel.layer.opacity = 0.4
       
        self.insertArrangedSubview(seperatorLabel, at: index + 1)
    }
}
