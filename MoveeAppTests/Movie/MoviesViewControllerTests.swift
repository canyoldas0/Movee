//
//  MoviesViewControllerTests.swift
//  MoveeAppUnitTests
//
//  Created by Can Yoldaş on 28.06.2022.
//

import UIKit
import XCTest
@testable import MoveeApp

class MoviesViewControllerTests: XCTestCase {
    private var viewModel: MockMoviesViewModel!
    private var sut: MoviesViewController!
    override func setUp() {
        viewModel = MockMoviesViewModel()
        sut = MoviesViewController(viewModel: viewModel)
    }
    
    override func tearDown() {
        viewModel = nil
        sut = nil
        super.tearDown()
    }
    
    func testFireDetailView() {
        let navigationVC = UINavigationController(rootViewController: sut)
        sut.fireDetailView(with: 321)
        
        
        XCTAssertTrue(navigationVC.visibleViewController is DetailViewController)
    }
}
 
fileprivate class MockMoviesViewModel: MoviesViewModelProtocol {
  
    var popularMovies: [Movie] = [.stub()]
    var topRatedMovies: [Movie] = [.stub()]
    
    
    var moviesState: MovieListViewStateBlock?
    var didCalledFetch = false
    
    func fetchData() {
        didCalledFetch = true
    }
    
    func subscribePopularList(completion: @escaping MovieListViewStateBlock) {
        moviesState = completion
    }
    
    func getNumberOfRows() -> Int {
        return popularMovies.count
    }
    
    func getItem(at index: Int) -> Movie {
        return popularMovies[index]
    }

}
            
