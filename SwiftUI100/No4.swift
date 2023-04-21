//
//  No4.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/04/21.
//

import SwiftUI

struct No4: View {
    var body: some View {
        Image("cat")
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay(RoundedRectangle(cornerRadius: 75).stroke(Color.black, lineWidth: 4))
    }
}

struct No4_Previews: PreviewProvider {
    static var previews: some View {
        No4()
    }
}
