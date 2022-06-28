//
//  LabelPack.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 23.06.2022.
//

import UIKit
import CYBase

enum ViewType {
    case lengthLabel
    case seasonNumber
    case releaseDate
}

struct IconLabelPackData {
    
    let viewType: ViewType?
    let string: String?
}

class IconLabelPack: CYBaseView<IconLabelPackData> {
    
 
    
    private lazy var container: UIStackView = {
        let temp = UIStackView()
        temp.spacing = 5
        temp.distribution = .equalSpacing
        temp.alignment = .leading
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var iconView: UIImageView = {
        let temp = UIImageView(image: UIImage(named: "star"))
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFit
        return temp
    }()
    
    private lazy var textLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "8.5"
        temp.font = .systemFont(ofSize: 15, weight: .regular)
        temp.textColor = .almostBlack
        return temp
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(container)
        container.addArrangedSubview(iconView)
        container.addArrangedSubview(textLabel)
        
        container.snp.makeConstraints( { $0.edges.equalToSuperview() })
        
        iconView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.height.equalTo(15)
            make.width.equalTo(15)
        }
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData(),
        let viewType = data.viewType,
        let string = data.string else {return}
        
        
        switch viewType {
        case .lengthLabel:
            iconView.image = UIImage(named: "time")
            textLabel.text = "\(string) min"
        case .seasonNumber:
            iconView.image = UIImage(named: "calendar")
            textLabel.text = "TV Series (\(string))"
        case .releaseDate:
            iconView.image = UIImage(named: "calendar")
            if let date = string.convertDate(from: .yyyyMMdd, to: .ddMMyyyy) {
                textLabel.text = date
            }
        }
        
    }
}
