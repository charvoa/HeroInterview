//
//  HeroInterviewTests.swift
//  HeroInterviewTests
//
//  Created by Nicolas CHARVOZ on 16/01/2019.
//  Copyright © 2019 Nicolas Charvoz. All rights reserved.
//

import XCTest
@testable import HeroInterview

class HeroInterviewTests: XCTestCase {
    func testAPIJson() {
        let dataService = DataService(withAPIClient: APIClient_Testable.shared)
        dataService.fetchItems { (success) in
            if (success) {
                XCTAssert(dataService.currentItems.count == 5)
            }
        }
    }

    func testAlphabeticalAZSort() {
        let dataService = DataService(withAPIClient: APIClient_Testable.shared)
        dataService.fetchItems { _ in }
        dataService.getItems(for: .alphaAZ)

        XCTAssert(dataService.currentItems[0].brandName == "A")
    }

    func testAlphabeticalZASort() {
        let dataService = DataService(withAPIClient: APIClient_Testable.shared)
        dataService.fetchItems { _ in }
        dataService.getItems(for: .alphaZA)

        XCTAssert(dataService.currentItems[0].brandName == "E")
    }

    func testSizeSort() {
        let dataService = DataService(withAPIClient: APIClient_Testable.shared)
        dataService.fetchItems { _ in }
        dataService.getItems(for: .size)

        XCTAssert(dataService.currentItems[0].brandName == "A")
    }

    func testHasImageSort() {
        let dataService = DataService(withAPIClient: APIClient_Testable.shared)
        dataService.fetchItems { _ in }
        dataService.getItems(for: .hasImage)

        XCTAssert(dataService.currentItems.isEmpty)
    }

    func testReset() {
        let dataService = DataService(withAPIClient: APIClient_Testable.shared)
        dataService.fetchItems { _ in }
        dataService.getItems(for: .reset)

        XCTAssert(dataService.currentItems.count == 5)
    }
}
