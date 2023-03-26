//
//  NetworkService.swift
//  TechTask
//
//  Created by Artemy Volkov on 16.03.2023.
//

import Foundation
import Combine

protocol DataServiceProtocol {
    func download(from url: URL) -> AnyPublisher<Data, Error>
    func handleCompletion(_ completion: Subscribers.Completion<Error>)
}

class NetworkService: DataServiceProtocol {
    // MARK: - NetworkError
    private enum NetworkError: LocalizedError {
        case badURLResponse(url: URL)
    }
    
    // MARK: - download
    func download(from url: URL) -> AnyPublisher<Data, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { try self.handleURLResponse(output: $0, url: url) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    // MARK: - URLResponse Handler
    func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              (200..<300) ~= response.statusCode else {
            throw NetworkError.badURLResponse(url: url)
        }
        return output.data
    }
    
    // MARK: - Completion Handler
    func handleCompletion(_ completion: Subscribers.Completion<Error>) {
        if case .failure(let error) = completion {
            print("❌ Error: \(error.localizedDescription)")
        }
    }
}
