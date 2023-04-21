//
//  No2.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/04/21.
//

import SwiftUI

struct No2: View {
    var body: some View {
        Image("cat")
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 200)
            .clipped()
            .background(Color.red)
    }
}

struct No2_Previews: PreviewProvider {
    static var previews: some View {
        No2()
    }
}
