//
//  No82.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

struct No82: View {
    @State private var scale: CGFloat = 1.0

    var body: some View {
        Image("cat")
            .resizable()
            .frame(width: 150, height: 150)
            .scaleEffect(scale)
            .gesture(MagnificationGesture()
                .onChanged { value in
                    scale = value.magnitude
                }
            )
    }
}

struct No82_Previews: PreviewProvider {
    static var previews: some View {
        No82()
    }
}
