//
//  CustomImageView.swift
//  future-up-ios
//
//  Created by Alex Bardea on 24.03.2022.
//

import SwiftUI

struct CustomImageView: View {
    var hasCircle: Bool
    var urlString: String
    var percentage: Double
    @ObservedObject var imageLoader = CoinImageViewModel()
    @State var image = UIImage()

    var body: some View {
        ZStack {
            if hasCircle {
                Circle()
                    .foregroundColor(Color("background"))
                    .overlay(LinearGradient(
                        gradient:
                            percentage >= 0 ?
                            Gradient(colors: [Color.green.opacity(0.4), Color.green.opacity(0.1)]) : Gradient(colors: [Color.red.opacity(0.3), Color.orange.opacity(0.1)]),
                        startPoint: .top,
                        endPoint: .bottom
                    ).cornerRadius(60 / 2)
                    )
                    .frame(width: 60, height: 60, alignment: .center)
            }

            Image(uiImage: image)
                .resizable()
                .accentColor(.red)
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .onReceive(imageLoader.$image) { downloadedImage in
                    self.image = downloadedImage
                }
                .onAppear {
                    imageLoader.loadImage(for: urlString)
                }
        }
    }
}
