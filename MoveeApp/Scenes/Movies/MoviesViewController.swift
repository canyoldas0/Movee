//
//  MoviesViewController.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 16.04.2022.
//

import UIKit
import CYBase

protocol MoviesViewModelProtocol {
    
    var popularMovies: [Movie] { get set }
    var topRatedMovies: [Movie] { get set }
    var moviesState: MovieListViewStateBlock? { get set}
    func fetchData()
    func subscribePopularList(completion: @escaping MovieListViewStateBlock)
    func getNumberOfRows() -> Int
    func getItem(at index: Int) -> Movie
}

class MoviesViewController: UIViewController {
    
    enum MoviesTableViewSection {
        case horizontalCollectionView
        case tableView
    }
    
    private var viewModel: MoviesViewModelProtocol!
    
    convenience init(viewModel: MoviesViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private let tableViewSections: [MoviesTableViewSection] = [.horizontalCollectionView, .tableView]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        setTableView()
        listenViewModel()
        viewModel.fetchData()
        view.backgroundColor = .moveeBlue
        navigationController?.navigationBar.backgroundColor = .moveeBlue
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .moveeBackground
        tableView.allowsSelection = true
        tableView.registerNib(withIdentifier: HeaderMoviesTableViewCell.identifier)
        tableView.registerNib(withIdentifier: ListTableViewCell.identifier)
    }
    
    func listenViewModel() {
        
        viewModel.subscribePopularList { [weak self] state in
            switch state {
            case .done:
                self?.tableView.reloadData()
            default:
                break
            }
        }
    }
    
    func fireDetailView(with id: Int) {
        let detailVC = DetailViewBuilder.build(with: id,
                                               contentType: .movie)
        navigationController?.pushViewController(detailVC, animated: false)
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
        case .tableView:
            return viewModel.getNumberOfRows()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = tableViewSections[indexPath.section]
        
        switch section {
            
        case .horizontalCollectionView:
            let cell = HeaderMoviesTableViewCell.dequeue(fromTableView: tableView, atIndexPath: indexPath)
            cell.setData(from: viewModel.topRatedMovies)
            cell.delegate = self
            return cell
        case .tableView:
            let cell = ListTableViewCell.dequeue(fromTableView: tableView, atIndexPath: indexPath)
            cell.setData(with: ListTableViewCellData(movie: viewModel.getItem(at: indexPath.row)))
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let section = tableViewSections[indexPath.section]
        
        switch section {
            
        case .horizontalCollectionView:
            return 500
        case .tableView:
            return 140
        }
    }
    
}

// MARK: ListCellAction Delegate
extension MoviesViewController: ListCellActionDelegate {
    
    func pushDetailView(with id: Int) {
        self.fireDetailView(with: id)
    }
}
