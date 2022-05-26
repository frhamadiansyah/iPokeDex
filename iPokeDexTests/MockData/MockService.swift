//
//  MockService.swift
//  iPokeDexTests
//
//  Created by Fandrian Rhamadiansyah on 26/05/22.
//

import Foundation
import Combine

@testable import iPokeDex

struct MockService: Requestable {
    
    var mockDataType: MockDataType
    
    func makes<T: Decodable>(request: URLRequest, decoder: JSONDecoder) -> AnyPublisher<T?, Error> {
        
        if mockDataType == .null {
            return Fail(error: PokeError.noData)
                .eraseToAnyPublisher()
        } else {
            return Just(MockData.getMockData(type: mockDataType))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
    }
    
}
