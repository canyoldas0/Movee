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
    
    private var  movies: [Movie]?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        scoreView.layer.cornerRadius = scoreView.height / 2
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: HorizontalScrollCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: HorizontalScrollCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setData(from data: [Movie]) {
        self.movies = data
        guard movies?.count != 0 else {return}
        self.setHeaderData(at: 0)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
           
        }
    }
    
    private func setHeaderData(at index: Int) {
        self.scoreLabel.text = "\(movies?[index].voteAverage ?? 0)"
        self.titleLabel.text = movies?[index].originalTitle
        self.categoriesLabel.text = "Comedy, Action"
    }

}

extension HeaderMoviesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalScrollCollectionViewCell.identifier, for: indexPath) as? HorizontalScrollCollectionViewCell else {return UICollectionViewCell() }
        cell.setImageData(with: movies?[indexPath.row].imageUrl)
        cell.clipsToBounds = true
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        
        visibleRect.origin = collectionView.contentOffset
        visibleRect.size = collectionView.bounds.size
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        guard let indexPath = collectionView.indexPathForItem(at: visiblePoint) else { return }
        
        setHeaderData(at: indexPath.row)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HeaderMoviesTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 260, height: 373)
        
    }
}
