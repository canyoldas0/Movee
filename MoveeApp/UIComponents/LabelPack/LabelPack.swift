//
//  LabelPack.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 23.06.2022.
//

import UIKit
import CYBase

class LabelPack: BaseView {
    
    enum ViewType {
        case lengthLabel
        case seasonNumber
        case releaseDate
    }
    
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
    
    private lazy var textLabel: UILabel = {
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
        container.addArrangedSubview(textLabel)
        
        container.snp.makeConstraints( { $0.edges.equalToSuperview() })
        
        iconView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(15)
            make.width.equalTo(15)
        }
    }
    
    func setData(for contentType: ViewType, value: String) {
        
        switch contentType {
        case .lengthLabel:
            iconView.image = UIImage(named: "time")
            textLabel.text = "\(value) min"
        case .seasonNumber:
            iconView.image = UIImage(named: "calendar")
            textLabel.text = "\(value) min"
        case .releaseDate:
            iconView.image = UIImage(named: "calendar")
            if let date = value.convertDate(from: .yyyyMMdd, to: .ddMMyyyy) {
                textLabel.text = date
            }
        }
    }
}
