//
//  No66.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

struct No66: View {
    @State private var stones = ["Cobblestone", "Stone", "SmoothStone"]
    var body: some View {
        NavigationStack {
            List {
                ForEach(stones, id: \.self) { stone in
                    Text(stone)
                }
                .onMove { (indexSet, index) in
                    stones.move(fromOffsets: indexSet, toOffset: index)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        EditButton()
                    }
                }
            }
        }
    }
}

struct No66_Previews: PreviewProvider {
    static var previews: some View {
        No66()
    }
}
