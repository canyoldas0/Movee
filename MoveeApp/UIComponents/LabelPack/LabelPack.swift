//
//  LabelPack.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 25.06.2022.
//

import UIKit
import CYBase

class LabelPack: BaseView {
    
    lazy var firstLabel: UILabel = {
       let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .systemFont(ofSize: 17, weight: .regular)
        temp.textColor = .almostBlack
        temp.layer.opacity = 0.8
        temp.text = ""
        return temp
    }()
    
    lazy var secondLabel: UILabel = {
       let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .systemFont(ofSize: 17, weight: .regular)
        temp.textColor = .vibrantBlue
        temp.layer.opacity = 0.8
        temp.text = ""
        return temp
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        
    }
}
