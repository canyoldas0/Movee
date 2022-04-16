//
//  ListTableViewCell.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 16.04.2022.
//

import UIKit
import Kingfisher

class ListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    
    private var data: ListTableViewCellData? {
        didSet {
            fillFields()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        scoreView.layer.cornerRadius = scoreView.height / 2
    }
    
    private func fillFields() {
        guard let data = data else {return}
        
        if let title = data.title {
            titleLabel.text = title
        }
        
        if let categoryString = data.categories {
            categoryLabel.text = categoryString
        }
        
        if let score = data.score {
            scoreLabel.text = score
        }
        
        if let urlString = data.imageUrl,
            let imageUrl = URL(string: urlString) {
            itemImageView.kf.setImage(with: imageUrl, placeholder: nil, options: nil, completionHandler: nil)
        }
        
        if let dateString = data.date?.formatDateWith(format: .ddMMyyyy) {
            dateLabel.text = dateString
        }
        
    }
    
    func setData(with data: ListTableViewCellData) {
        self.data = data
    }
}
