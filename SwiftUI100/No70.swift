//
//  No70.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

struct No70: View {
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
                    .modifier(ClearButton(text: $text))
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

private struct ClearButton: ViewModifier {
    @Binding var text: String
    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "delete.left")
                        .foregroundColor(Color.gray)
                }
                .padding(.trailing, 8)
            }
        }
    }
}

struct No70_Previews: PreviewProvider {
    static var previews: some View {
        No70()
    }
}
