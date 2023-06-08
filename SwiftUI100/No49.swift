//
//  No49.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/08.
//

import SwiftUI

struct No49: View {
    var body: some View {
        Image("cat")
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 150)
            .overlay(
                Text("ちーたん")
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            )
    }
}

struct No49_Previews: PreviewProvider {
    static var previews: some View {
        No49()
    }
}
