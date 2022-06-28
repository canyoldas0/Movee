//
//  MoviesViewModelTests.swift
//  MoveeAppUnitTests
//
//  Created by Can Yoldaş on 28.06.2022.
//

import Foundation
import XCTest
import Combine
@testable import MoveeApp

class MoviesViewModelTests: XCTestCase {
    
    private var sut: MoviesViewModel!
    private var networkService: MockNetworkService!
    
    override func setUp() {
        networkService = MockNetworkService()
        sut = MoviesViewModel(moviesAPI: networkService)
    }
    
    override func tearDown() {
        networkService = nil
        sut = nil
        super.tearDown()
    }
    
    func testFetchData() {
        // When
        sut.fetchData()
        
        // Then
        XCTAssertEqual(sut.popularMovies.count, 1)
        XCTAssertEqual(sut.topRatedMovies.count, 2)
    }
    
    func testGetNumberOfItems() {
        sut.fetchData()
        
        XCTAssertEqual(sut.getNumberOfRows(), 1)
    }
    
}


fileprivate class MockNetworkService: MoviesNetworkProtocol {
    
    func getPopularMovies() -> AnyPublisher<MovieListResponse, Error> {
        return Just(MovieListResponse.init(results: [.stub(), .stub()]))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
 
    func getTopRatedMovies() -> AnyPublisher<MovieListResponse, Error> {
        return Just(MovieListResponse.init(results: [.stub()]))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

