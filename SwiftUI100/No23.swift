//
//  No23.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

struct No23: View {
    var body: some View {
        VStack {
            CardView {
                Text("Cobblestone")
            }
            CardView(color: Color.red, radius: 20) {
                Text("Magma Block")
            }
            CardView(color: Color.mint.opacity(0.4)) {
                Text("Sea Lantern")
            }
        }
    }
}

struct CardView<Content>: View where Content: View {
    let color: Color
    let radius: CGFloat
    let content: () -> Content

    init(color: Color = Color.gray.opacity(0.4),
         radius: CGFloat = 8,
         @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.color = color
        self.radius = radius
    }

    var body: some View {
        content()
            .padding(16)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: color, radius: radius, x: 4, y: 4)
            .padding(radius + 8)
    }
}

struct No23_Previews: PreviewProvider {
    static var previews: some View {
        No23()
    }
}
