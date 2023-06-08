//
//  No69.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

struct No69: View {
    private let blocks: [String] = [
        "Cobblestone",
        "Stone",
        "Smooth Stone",
        "Sand",
        "Dirt",
        "Grass Block",
        "Terracotta",
        "Block of Amethyst",
        "Block of Quartz",
        "Dripstone Block"
    ]
    @State var text: String = ""
    var filtered: [String] {
        if text.isEmpty {
            return blocks
        } else {
            return blocks.filter { $0.uppercased().contains(text.uppercased()) }
        }
    }
    var body: some View {
        ScrollView {
            LazyVStack {
                TextField("Type your search...", text: $text)
                    .padding(8)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                ForEach(filtered, id: \.self) { block in
                    VStack(alignment: .leading) {
                        Text(block)
                            .padding(.leading, 12)
                        Divider()
                    }
                }
            }
        }
    }
}

struct No69_Previews: PreviewProvider {
    static var previews: some View {
        No69()
    }
}
