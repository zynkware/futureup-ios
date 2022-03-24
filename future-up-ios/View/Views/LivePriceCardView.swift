//
//  LivePriceCardView.swift
//  future-up-ios
//
//  Created by Alex Bardea on 23.03.2022.
//

import SwiftUI

struct LivePriceCardView: View {
    var title: String
    var value: Double
    var percentage: Double
    var imageUrl: String
    
    @EnvironmentObject var viewModel: HomeViewModel
    var body: some View {
        HStack(spacing: UIViewConstants.padding) {
            CustomImageView(hasCircle: true, urlString: imageUrl, percentage: percentage)
        
            VStack(alignment: .leading, spacing: 5) {
                Text(title).font(.title3).fontWeight(.semibold)
                Text("$ \(String(format: "%.2f", value))").font(.body).foregroundColor(Color.black.opacity(0.7))
            }
            Spacer()
            Text("\(String(format: "%.2f", percentage))%").font(.title2).fontWeight(.bold).foregroundColor(percentage >= 0 ? .green : .red)
        }

        .frame(height: 100)
        .padding([.leading, .trailing], UIViewConstants.padding)
        .background(Color.white)
        .background(Rectangle().fill(Color.white).shadow(radius: 1))
    }
}
