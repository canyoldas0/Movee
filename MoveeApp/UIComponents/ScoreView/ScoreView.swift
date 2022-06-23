//
//  ScoreView.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 23.06.2022.
//

import UIKit
import CYBase

class ScoreView: BaseView {
    
    private lazy var container: UIStackView = {
        let temp = UIStackView()
        temp.spacing = 5
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .moveeBlue
        temp.roundCorner(with: 12)
        return temp
    }()
    
    private lazy var iconView: UIImageView = {
        let temp = UIImageView(image: UIImage(named: "star"))
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.tintColor = .moveeWhite
        temp.contentMode = .scaleAspectFit
        return temp
    }()
    
    private lazy var scoreLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "8.5"
        temp.font = .systemFont(ofSize: 12, weight: .black)
        temp.textColor = .moveeWhite
        return temp
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(container)
        container.addArrangedSubview(iconView)
        container.addArrangedSubview(scoreLabel)
        
        container.snp.makeConstraints( { $0.edges.equalToSuperview() })
        
        iconView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(15)
            make.width.equalTo(15)
        }
    }
    
    func setScore(with score: Double?) {
        guard let score = score else {return}
        scoreLabel.text = "\(score)"
    }
    
}
