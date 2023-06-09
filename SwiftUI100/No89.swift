//
//  No89.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

struct No89: View {
    var body: some View {
        Text("Test")
    }
}

struct No89_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            No89()
                .previewDevice("iPhone SE (3rd generation)")
            No89()
                .previewDevice("iPhone 14")
        }
    }
}
