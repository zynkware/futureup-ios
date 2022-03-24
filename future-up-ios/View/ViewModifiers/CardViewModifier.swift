//
//  CardViewModifier.swift
//  future-up-ios
//
//  Created by Alex Bardea on 23.03.2022.
//

import SwiftUI

struct CardViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .frame(width: 0.85 * screen.width)
            .padding([.top, .bottom], 30)
            .shadow(color: Color.black.opacity(0.2), radius: 30, x: 0, y: 10)
            .shadow(color: Color.black.opacity(0.2), radius: 30, x: 0, y: 20)
    }
}

extension View {
    func withCardModifier() -> some View {
        modifier(CardViewModifier())
    }
    // For background cards
    func withCardModifierBack(offset: CGFloat = -1) -> some View {
        self
            .withCardModifier()
            .offset(x: offset * 0.92 * screen.width, y: 0)
            .scaleEffect(0.85)
    }
  
}
