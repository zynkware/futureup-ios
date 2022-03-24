//
//  CardView.swift
//  future-up-ios
//
//  Created by Alex Bardea on 24.03.2022.
//

import Combine
import SwiftUI

struct CardView: View {
    var balance: Double
    var cardHolderName: String
    var color1: Color
    var color2: Color
    var isDummy: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(isDummy ? "" : UIViewConstants.Dashboard.cardTitle).font(.caption2).fontWeight(.regular)
            Text(isDummy ? "" : "$ \(String(format: "%.2f", balance))").font(.title).bold()

            Text(isDummy ? UIViewConstants.Dashboard.cardLabel1_default : UIViewConstants.Dashboard.cardLabel1)
                .font(.title2).bold()
                .padding(.top, UIViewConstants.padding)
                .padding(.bottom, UIViewConstants.padding)

            Text(isDummy ? "" : UIViewConstants.Dashboard.cardLabel2.uppercased()).font(.caption2)
            Text(cardHolderName).font(.title3).bold()
        }
        .padding(UIViewConstants.padding)
        .foregroundColor(.white)
        .background(
            LinearGradient(
                gradient:
                Gradient(
                    colors: [color1, color2]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: UIViewConstants.Dashboard.cardHeight)
            .overlay(
                Rectangle()
                    .trim(from: 0, to: 0.5)
                    .fill(
                        LinearGradient(gradient:
                            Gradient(colors: [Color.black, Color.white]), startPoint: .topTrailing, endPoint: .bottomLeading)
                    )
                    .opacity(0.08)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            )
        )
        .cornerRadius(20)
    }
}
