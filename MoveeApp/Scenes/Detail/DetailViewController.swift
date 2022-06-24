//
//  DetailViewController.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 22.06.2022.
//

import UIKit
import CYBase
import SnapKit

class DetailViewController: CYViewController<DetailViewModel> {
    
    var contentType: ContentType?
    
    
    lazy var imageView: UIImageView = {
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
    
    lazy var descriptionLabel: UILabel = {
       let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .systemFont(ofSize: 17, weight: .regular)
        temp.numberOfLines = 0
        temp.text = "In Gotham City, mentally-troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: The Joker."
        temp.textColor = .almostBlack
        temp.layer.opacity = 0.8
        return temp
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .clear
        view.backgroundColor = .moveeBackground
        
        viewModel.getDetailData(for: contentType)
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(400)
        }
        
        view.addSubview(scoreView)
        
        scoreView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.bottom.equalTo(imageView.snp.bottom).offset(12)
        }
        
        view.addSubview(labelStackView)
        
        labelStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalTo(scoreView.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(24)
        }

        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(categoryLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
        }
        
        labelStackView.setCustomSpacing(10, after: categoryLabel)
        
        timeLabelStack.addArrangedSubview(lengthLabel)
        timeLabelStack.addArrangedSubview(yearLabel)
        
        
        timeLabelStack.addHorizontalSeperator(after: lengthLabel)
        labelStackView.addArrangedSubview(timeLabelStack)
        
        let lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .almostBlack
        lineView.layer.opacity = 0.4
        
        labelStackView.addArrangedSubview(lineView)
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        
        labelStackView.setCustomSpacing(20, after: timeLabelStack)
        
        labelStackView.addArrangedSubview(descriptionLabel)
        
        labelStackView.setCustomSpacing(20, after: lineView)
        
        lengthLabel.setData(for: .lengthLabel, value: "56")
        yearLabel.setData(for: .seasonNumber, value: "2014 - 2018")
        
    }
    
}
