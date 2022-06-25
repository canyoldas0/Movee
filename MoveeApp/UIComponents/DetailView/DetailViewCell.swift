//
//  DetailViewCell.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 25.06.2022.
//

import UIKit
import CYBase


class DetailViewCell: CYTableViewCell {
    
    private lazy var contentStack: UIStackView = {
        let temp = UIStackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
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
        temp.text = "In Gotham City, mentally-troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: The Joker.In Gotham City, mentally-troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: The Joker.In Gotham City, mentally-troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: The Joker."
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
        
        addSubview(contentStack)
        
        contentStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentStack.addArrangedSubview(posterImageView)
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
        
        seperatorLine.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        
        posterImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(400)
        }
    
        scoreView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.bottom.equalTo(posterImageView.snp.bottom).offset(12)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalTo(scoreView.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
        }
        
        castCardView.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
        labelStackView.setCustomSpacing(10, after: categoryLabel)
        labelStackView.setCustomSpacing(20, after: timeLabelStack)
        labelStackView.setCustomSpacing(20, after: seperatorLine)
        labelStackView.setCustomSpacing(20, after: descriptionLabel)
        labelStackView.setCustomSpacing(20, after: directorLabel)
        
        contentStack.setCustomSpacing(20, after: labelStackView)
    }
    
    func setData(data: CYDataProtocol?) {
        
    }
}
    

