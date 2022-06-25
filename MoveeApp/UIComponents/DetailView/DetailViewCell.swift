//
//  DetailViewCell.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 25.06.2022.
//

import UIKit
import CYBase
import Kingfisher

struct DetailViewCellData: CYDataProtocol {
    
    let imageUrl: String?
    let score: Double?
    let title: String?
    let categories: String?
    let lengthData: IconLabelPackData?
    let yearData: IconLabelPackData?
    let description: String?
    let directorData: LabelPackData?
    let castData: CastCardViewData?
}


class DetailViewCell: CYTableViewCell {
    
    private lazy var contentStack: UIStackView = {
        let temp = UIStackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .clear
        temp.axis = .vertical
        return temp
    }()
    
    lazy var posterImageView: UIImageView = {
        let temp = UIImageView(image: UIImage(named: "group4"))
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    lazy var labelStackView: UIStackView = {
        let temp = UIStackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.spacing = 5
        return temp
    }()
    
    lazy var scoreView: ScoreView = {
        let temp = ScoreView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.heightAnchor.constraint(equalToConstant: 24).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 61).isActive = true
        return temp
    }()
    
    
    lazy var titleLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .systemFont(ofSize: 24, weight: .bold)
        temp.text = "Joker"
        temp.numberOfLines = 0
        temp.textColor = .black
        return temp
    }()
    
    lazy var categoryLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .systemFont(ofSize: 15, weight: .medium)
        temp.text = "Category, Thriller"
        temp.textColor = .almostBlack
        return temp
    }()
    
    lazy var timeLabelStack: UIStackView = {
        let temp = UIStackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.distribution = .fillProportionally
        temp.spacing = 15
        return temp
    }()
    
    lazy var lengthLabel: IconLabelPack = {
        let temp = IconLabelPack()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    lazy var yearLabel: IconLabelPack = {
        let temp = IconLabelPack()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    lazy var seperatorLine: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .almostBlack
        temp.layer.opacity = 0.4
        return temp
    }()
    
    lazy var descriptionLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .systemFont(ofSize: 17, weight: .regular)
        temp.numberOfLines = 0
        temp.text = "Lorem Ipsum"
        temp.textColor = .almostBlack
        temp.layer.opacity = 0.8
        return temp
    }()
    
    lazy var directorLabel: LabelPack = {
        let temp = LabelPack()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    lazy var castCardView: CastCardView = {
        let temp = CastCardView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    
    override func addViewComponents() {
        super.addViewComponents()
        
        backgroundColor = .clear
        addSubview(contentStack)
        
        
        contentStack.addArrangedSubview(posterImageView)
        addSubview(scoreView)
        contentStack.addArrangedSubview(labelStackView)
        
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(categoryLabel)
        labelStackView.addArrangedSubview(timeLabelStack)
        
        timeLabelStack.addArrangedSubview(lengthLabel)
        timeLabelStack.addArrangedSubview(yearLabel)
        timeLabelStack.addHorizontalSeperator(after: lengthLabel)
        
        labelStackView.addArrangedSubview(seperatorLine)
        labelStackView.addArrangedSubview(descriptionLabel)
        labelStackView.addArrangedSubview(directorLabel)
        
        contentStack.addArrangedSubview(castCardView)
        
        contentStack.setCustomSpacing(20, after: labelStackView)
        labelStackView.setCustomSpacing(10, after: categoryLabel)
        labelStackView.setCustomSpacing(20, after: timeLabelStack)
        labelStackView.setCustomSpacing(20, after: seperatorLine)
        labelStackView.setCustomSpacing(20, after: descriptionLabel)
        labelStackView.setCustomSpacing(20, after: directorLabel)
        
        
        contentStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        posterImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(400)
        }
        
        
        seperatorLine.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
        }
        
        scoreView.snp.makeConstraints { make in
            make.leading.equalTo(contentStack.snp.leading).inset(24)
            make.bottom.equalTo(posterImageView.snp.bottom).offset(12)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalTo(scoreView.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(24)
        }
        
        castCardView.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
    }
    
    func setData(data: CYDataProtocol?) {
        guard let data = data as? DetailViewCellData,
        let imageString = data.imageUrl else {return}
        
        if let imageUrl = URL(string: imageString) {
            posterImageView.kf.setImage(with: imageUrl)
        }
        
        scoreView.setScore(with: data.score)
        titleLabel.text = data.title
        categoryLabel.text = data.categories
        lengthLabel.setData(data: data.lengthData)
        yearLabel.setData(data: data.yearData)
        descriptionLabel.text = data.description
        directorLabel.setData(data: data.directorData)
        castCardView.setData(data: data.castData)
    }
}


