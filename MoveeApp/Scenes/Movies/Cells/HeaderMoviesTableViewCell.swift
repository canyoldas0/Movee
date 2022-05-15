//
//  HeaderMoviesTableViewCell.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 16.04.2022.
//

import UIKit

class HeaderMoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        scoreView.layer.cornerRadius = scoreView.height / 2
    }
    
    private func setupCollectionView() {
                collectionView.register(UINib(nibName: VerticalScrollCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: VerticalScrollCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self

}
    
}

extension HeaderMoviesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalScrollCollectionViewCell.identifier, for: indexPath)
        self.scoreLabel.text = "8.3"
        self.titleLabel.text = "Batman"
        self.categoriesLabel.text = "Comedy, Action"
        cell.clipsToBounds = true
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HeaderMoviesTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 260, height: 373)
        
    }
    
    
}
