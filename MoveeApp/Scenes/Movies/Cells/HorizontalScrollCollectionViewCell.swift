//
//  VerticalScrollCollectionViewCell.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 17.04.2022.
//

import UIKit
import Kingfisher

class HorizontalScrollCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 8
    }
    
    func setImageData(with string: String?) {
        guard let string = string, let url = URL(string: string) else {return }
        cardImageView.kf.setImage(with: url)
    }

}
