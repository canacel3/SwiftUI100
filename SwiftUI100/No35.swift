//
//  No35.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/28.
//

import SwiftUI

struct No35: View {
    private let blocks = [
        Block(name: "丸石", englishName: "Cobblestone", imageName: "Cobblestone"),
        Block(name: "石", englishName: "Stone", imageName: "Stone"),
        Block(name: "土", englishName: "Dirt", imageName: "Dirt"),
        Block(name: "砂", englishName: "Sand", imageName: "Sand"),
        Block(name: "草ブロック", englishName: "Grass Block", imageName: "GrassBlock"),
        Block(name: "テラコッタ", englishName: "Terracotta", imageName: "Terracotta")
    ]
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(blocks, id: \.self) { block in
                BlockCard(block: block)
            }
        }.padding()
    }
}

struct BlockCard: View {
    fileprivate var block: Block
    var body: some View {
        HStack {
            Image(block.imageName)
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .center) {
                Text(block.name)
                Text(block.englishName)
            }
        }
        .border(Color.black, width: 2)
    }
}

private struct Block: Hashable {
    let name: String
    let englishName: String
    let imageName: String
}

struct No35_Previews: PreviewProvider {
    static var previews: some View {
        No35()
    }
}
