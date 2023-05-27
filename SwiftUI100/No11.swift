//
//  No11.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

struct No11: View {
    private let stones = ["Cobblestone", "Stone", "SmoothStone"]
    var body: some View {
        List {
            ForEach(stones, id: \.self) { stone in
                NavigationLink(destination: Text(stone), label: {
                    Text(stone)
                })
            }
        }
    }
}

struct No11_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            No11()
        }
    }
}
