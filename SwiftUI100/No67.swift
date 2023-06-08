//
//  No67.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

struct No67: View {
    private let stones = ["Cobblestone", "Stone", "SmoothStone"]
    var body: some View {
        List(stones, id: \.self) { stone in
            HStack {
                Text(stone)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                print(stone)
            }
        }
    }
}

struct No67_Previews: PreviewProvider {
    static var previews: some View {
        No67()
    }
}
