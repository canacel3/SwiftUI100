//
//  No24.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

struct No24: View {
    var body: some View {
        VStack {
            Text("Cobblestone").card()
            Text("Magma Block").card(color: Color.red, radius: 20)
            Text("Sea Lantern").card(color: Color.mint.opacity(0.8))
        }
    }
}

struct CardViewModifier: ViewModifier {
    let color: Color
    let radius: CGFloat
    func body(content: Content) -> some View {
        content
            .padding(16)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: color, radius: radius, x: 4, y: 4)
            .padding(radius + 8)
    }
}

extension View {
    func card(color: Color = Color.gray.opacity(0.4),
              radius:CGFloat = 8) -> some View {
        modifier(CardViewModifier(color: color, radius: radius))
    }
}

struct No24_Previews: PreviewProvider {
    static var previews: some View {
        No24()
    }
}
