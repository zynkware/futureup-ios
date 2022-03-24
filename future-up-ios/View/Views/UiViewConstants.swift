//
//  UiViewConstants.swift
//  future-up-ios
//
//  Created by Alex Bardea on 23.03.2022.
//

import UIKit

struct UIViewConstants {
    enum Networking {
        static let url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
    }
    enum Dashboard {
        static let mainTitle = "Your wallet"
        static let mainSubtitle = "Live prices"
        static let cardTitle = "Balance"
        static let cardLabel1 = "****       ****     ****       1234"
        static let cardLabel1_default = "****       ****     ****       ****"
        static let cardLabel2 = "Card holder"
        static let portfolioTitle = "Portfolio"
        static let cardHeight: CGFloat = 200
    }
    enum Portfolio {
        static let portfolioTitle = "Portfolio"
        static let backBtn = "arrow.backward"
    }
    
    static let padding: CGFloat = 20
}

let screen = UIScreen.main.bounds
