//
//  VerticalScrollCollectionViewCell.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 17.04.2022.
//

import UIKit
import Network

class VerticalScrollCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 8
    }

}
