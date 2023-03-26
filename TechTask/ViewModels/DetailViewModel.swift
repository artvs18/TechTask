//
//  DetailViewModel.swift
//  TechTask
//
//  Created by Artemy Volkov on 21.03.2023.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {
    @Published private(set) var detail = Detail(
        name: "",
        description: "",
        rating: 0.0,
        numberOfReviews: 0,
        price: 0, colors: [],
        imageUrls: []
    )
    
    private let detailURL = "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239"
    
    private var cancellables: Set<AnyCancellable> = []
    
    let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        fetchDetail()
    }
}

extension DetailViewModel {
    // MARK: - Fetch Detail
    private func fetchDetail() {
        guard let url = URL(string: detailURL) else { return }
        
        dataService.download(from: url)
            .decode(type: Detail.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: dataService.handleCompletion) { [unowned self] detail in
                self.detail = detail
            }
            .store(in: &cancellables)
    }
}
