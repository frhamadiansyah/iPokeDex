//
//  PokeResponseTests.swift
//  iPokeDexTests
//
//  Created by Fandrian Rhamadiansyah on 25/05/22.
//

import XCTest
@testable import iPokeDex

class PokeResponseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPokemonList() throws {
        let sut = MockData.getPokeResponse(type: .pokemonList)
        let expectedResult = "bulbasaur"
        let result = sut?.results.first?.name
        
        XCTAssert(expectedResult == result, "Expected \(expectedResult), but got \(result) instead")
    }
    
    func testPokemonDetail() throws {
        let sut = MockData.getPokeResponse(type: .pokemonList)
        let expectedResult = "bulbasaur"
        let result = sut?.results.first?.name
        
        XCTAssert(expectedResult == result, "Expected \(expectedResult), but got \(result) instead")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
