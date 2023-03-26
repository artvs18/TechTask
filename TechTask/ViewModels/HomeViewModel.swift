//
//  HomeViewModel.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    // MARK: - Categories
    @Published private(set) var categoryIcons: [Icon] = [
        .phones, .headphones, .games, .cars, .furniture, .kids
    ]
    
    // MARK: - Carousels
    @Published private(set) var isAllDataLoaded = false
    @Published private(set) var latest = Latest(items: [])
    @Published private(set) var flashSale = FlashSale(items: [])
    
    // MARK: - Search Properties
    @Published var isSearchShowing = false
    @Published var searchFieldText = "" {
        didSet {
            isSearchShowing = !searchFieldText.isEmpty
        }
    }
    @Published var searchResult: [String] = []
    @Published private(set) var wordSearch = Word(words: [])
    
    // MARK: - API
    private let latestURL = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    private let flashSaleURL = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
    private let wordsURL = "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19"
    
    private var cancellables: Set<AnyCancellable> = []
    
    let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        loadData()
        checkDataLoad()
        searchText()
    }
}

// MARK: - Data Load
extension HomeViewModel {
    func loadData() {
        fetchLatest()
        fetchFlashSale()
    }
    
    private func checkDataLoad() {
        $latest
            .combineLatest($flashSale)
            .map { !$0.items.isEmpty && !$1.items.isEmpty }
            .eraseToAnyPublisher()
            .sink { [unowned self] isAllDataLoaded in
                DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1) {
                    self.isAllDataLoaded = isAllDataLoaded
                }
            }
            .store(in: &cancellables)
    }
    
    private func fetchLatest() {
        guard let url = URL(string: latestURL) else { return }
        
        dataService.download(from: url)
            .decode(type: Latest.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: dataService.handleCompletion) { [unowned self] latest in
                self.latest = latest
            }
            .store(in: &cancellables)
    }
    
    private func fetchFlashSale() {
        guard let url = URL(string: flashSaleURL) else { return }
        
        dataService.download(from: url)
            .decode(type: FlashSale.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: dataService.handleCompletion) { [unowned self] flashSale in
                self.flashSale = flashSale
            }
            .store(in: &cancellables)
    }
}

// MARK: Search
extension HomeViewModel {
    private func fetchWords() {
        guard let url = URL(string: wordsURL) else { return }
        
        dataService.download(from: url)
            .decode(type: Word.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: dataService.handleCompletion) { [unowned self] word in
                self.wordSearch = word
            }
            .store(in: &cancellables)
    }
    
    private func searchText() {
        $searchFieldText
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { (text) -> String in
                if text.count < 1 {
                    self.searchResult = []
                }
                return text
            }
            .sink { [unowned self] text in
                self.fetchWords()
                self.searchResult = self.wordSearch.words.filter {
                    $0.lowercased().contains(text.lowercased())
                }
            }
            .store(in: &cancellables)
    }
}
