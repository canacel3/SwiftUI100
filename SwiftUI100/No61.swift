//
//  No61.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/08.
//

import SwiftUI

struct No61: View {
    @State private var blocks: [Block] = [
        Block(imageName: "Cobblestone"),
        Block(imageName: "Stone"),
        Block(imageName: "Dirt"),
        Block(imageName: "GrassBlock"),
        Block(imageName: "Sand"),
        Block(imageName: "Terracotta")
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(blocks) { block in
                    Image(block.imageName)
                        .resizable()
                        .frame(width: 150, height: 150)
                }
            }
        }
    }
}

private struct Block: Identifiable {
    var id: String {
        return imageName
    }
    let imageName: String
}

struct No61_Previews: PreviewProvider {
    static var previews: some View {
        No61()
    }
}
