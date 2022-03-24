//
//  CoinImageViewModel.swift
//  future-up-ios
//
//  Created by Alex Bardea on 24.03.2022.
//

import SwiftUI

class CoinImageViewModel: ObservableObject {
    @Published var image = UIImage()

    func loadImage(for urlString: String) {
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, _ in
            guard let data = data, let response = response as? HTTPURLResponse,
                  response.statusCode >= 200, response.statusCode < 300 else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
}
