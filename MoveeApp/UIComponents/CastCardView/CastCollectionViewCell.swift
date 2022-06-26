//
//  CastCollectionViewCell.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 25.06.2022.
//

import UIKit
import Kingfisher
import CYBase

struct CastCollectionViewCellData: CYDataProtocol {
    let id: Int
    let name: String
    let imageUrl: String
}

class CastCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }
    
    private func configureViews() {
        nameLabel.layer.opacity = 0.8
        nameLabel.textColor = .almostBlack
        imageView.roundCorner()
    }

    
    func setData(from data: CastCollectionViewCellData) {
        guard let url = URL(string: data.imageUrl) else {return}
        imageView.kf.setImage(with: url)
        nameLabel.text = data.name
    }
}
