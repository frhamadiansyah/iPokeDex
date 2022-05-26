//
//  APIService.swift
//  iPokeDex
//
//  Created by Fandrian Rhamadiansyah on 25/05/22.
//

import Foundation
import Combine

enum PokeError: Error {
    case noData
}

protocol Requestable {
    func makes<T: Decodable>(request: URLRequest, decoder: JSONDecoder) -> AnyPublisher<T?, Error>
}

struct APIService: Requestable {
    
    static let shared = APIService()
    

    func make(request: URLRequest, decoder: JSONDecoder) -> AnyPublisher<PokeResponse, Error> {
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap({ output in
                do {
                    let result = try decoder.decode(PokeResponse.self, from: output.data)
                    return result
                    
                } catch {
                    print(error.localizedDescription)
                    throw error
                }
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func makes<T: Decodable>(request: URLRequest, decoder: JSONDecoder) -> AnyPublisher<T?, Error> {
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap({ output in
                do {
                    let result = try decoder.decode(T.self, from: output.data)
                    return result
                    
                } catch {
                    print(error.localizedDescription)
                    throw error
                }
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}