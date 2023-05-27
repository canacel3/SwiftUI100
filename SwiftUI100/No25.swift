//
//  No25.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

struct No25: View {
    @State private var stones = ["Cobblestone", "Stone", "SmoothStone"]
    var body: some View {
        NavigationStack {
            List {
                ForEach(stones, id: \.self) { stone in
                    Text(stone)
                }
                .onDelete(perform: delete)
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

    func delete(at offsets: IndexSet) {
        stones.remove(atOffsets: offsets)
    }
}

struct No25_Previews: PreviewProvider {
    static var previews: some View {
        No25()
    }
}
