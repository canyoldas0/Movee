//
//  MoviesViewController.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 16.04.2022.
//

import UIKit
import CYBase

class MoviesViewController: CYViewController<MoviesViewModel> {
    
    enum MoviesTableViewSection {
        
        case horizontalCollectionView
        case verticalTableView
    }

    @IBOutlet weak var tableView: UITableView!
    
    
    private let tableViewSections: [MoviesTableViewSection] = [.horizontalCollectionView, .verticalTableView]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
//        listenViewModel()
//        viewModel.getPopularMoviesData()
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(withIdentifier: HeaderMoviesTableViewCell.identifier)
        tableView.registerNib(withIdentifier: ListTableViewCell.identifier)
    }
    
    private func listenViewModel() {
        
        viewModel.subscribePopularList { [weak self] state in
            switch state {
            case .done:
                self?.tableView.reloadData()
            default:
                break
            }
        }
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let section = tableViewSections[section]
        
        switch section {
        case .horizontalCollectionView:
            return 1
        case .verticalTableView:
            return 3
       
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = tableViewSections[indexPath.section]
        
        switch section {
            
        case .horizontalCollectionView:
            let cell = HeaderMoviesTableViewCell.dequeue(fromTableView: tableView, atIndexPath: indexPath)
            return cell
        case .verticalTableView:
            let cell = ListTableViewCell.dequeue(fromTableView: tableView, atIndexPath: indexPath)
            cell.setData(with: ListTableViewCellData(title: "Joker", categories: "Comedy", date: nil, score: "8.9", imageUrl: nil))
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let section = tableViewSections[indexPath.section]
        
        switch section {
            
        case .horizontalCollectionView:
            return 600
        case .verticalTableView:
            return 140
            
        }
    }

}
