//
//  GetAroundTests.swift
//  GetAroundTests
//
//  Created by Baptiste Faure on 13/06/2024.
//

@testable import GetAround
import XCTest

final class GetAroundTests: XCTestCase {
    var viewModel: HomeViewModel!

    override func setUpWithError() throws {
        viewModel = .init()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testInitialCars() {
        XCTAssertTrue(viewModel.cars.isEmpty, "Cars should be empty before loading")
    }

    func testLoadCars() async {
        await viewModel.loadCars()
        XCTAssertFalse(viewModel.cars.isEmpty, "Cars should not be empty after loading")
    }
}
