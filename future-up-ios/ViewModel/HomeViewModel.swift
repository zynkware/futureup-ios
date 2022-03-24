//
//  HomeViewModel.swift
//  future-up-ios
//
//  Created by Alex Bardea on 22.03.2022.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    // MARK: - Properties
    // TO DO - Store final-balance and all my crypto coins
    // @Published var allCoins: [CryptoCoinModel] = [] -> Update CryptoCoinModel
    // @Published var finalBalance: Double = 0.0
    
    @Published var allCoins: [CryptoCoinModel] = []
    @Published var isLoading: Bool = true
    
    @Published var image: UIImage? = nil
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getCoins()
        reloadAllMyCoins()
    }
    
    func reloadAllMyCoins() {} // Fetch your coins from wallet
    
    func storeAllMyCoins() {} // Store your coins to wallet
    
    func getCoins() {
        guard let url = URL(string: UIViewConstants.Networking.url) else { return }
        
        // Combine workflow:
        // 1. Create the dataTaskPublisher
        // 2. Recieve -> where to receive data: main thread
        // 3. TryMap -> we check that the data != nil
        // 4. Decode -> decode data to our Model
        // 5. Sink -> receive data in ViewModel
        // 6. Store -> cancel subscription
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [CryptoCoinModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .sink(receiveValue: { [weak self] returnedCoins in
                
                // Optional: check if we have other coins by id
                self?.allCoins = returnedCoins
                self?.isLoading = false
            })
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200, response.statusCode < 300
        else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
