//
//  LabelPack.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 25.06.2022.
//

import UIKit
import CYBase

struct LabelPackData {
    let contentType: ContentType
    let string: String
}

class LabelPack: CYBaseView<LabelPackData> {
    
    private lazy var container: UIView = {
       let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var firstLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .systemFont(ofSize: 17, weight: .regular)
        temp.textColor = .almostBlack
        temp.layer.opacity = 0.8
        temp.text = "asdasd"
        return temp
    }()
    
    private lazy var secondLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .systemFont(ofSize: 17, weight: .semibold)
        temp.textColor = .vibrantBlue
        temp.layer.opacity = 0.8
        temp.text = "adsa"
        return temp
    }()
    
    override func setupViews() {
        super.setupViews()
        
        // Constraints
        addSubview(container)
        container.addSubview(firstLabel)
        container.addSubview(secondLabel)
        
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        firstLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        secondLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(firstLabel.snp.trailing).offset(5)
        }
    }
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else {return}
        switch data.contentType {
        case .movie:
            firstLabel.text = "Director:"
        case .tvSeries:
            firstLabel.text = "Creators:"
        }
        secondLabel.text = data.string
    }
    
    
}
