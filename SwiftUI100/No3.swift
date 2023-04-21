//
//  No3.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/04/21.
//

import SwiftUI

struct No3: View {
    var body: some View {
        Image("cat")
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
    }
}

struct No3_Previews: PreviewProvider {
    static var previews: some View {
        No3()
    }
}
