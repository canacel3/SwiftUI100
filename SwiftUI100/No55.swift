//
//  No55.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/08.
//

import SwiftUI

struct No55: View {
    @State private var isPresented = false
    @State private var sheetItem: SheetItem = .cobblestone
    var body: some View {
        VStack(spacing: 16) {
            Button(action: {
                isPresented.toggle()
                sheetItem = .cobblestone
            }) {
                Text("Cobblestone")
            }
            Button(action: {
                isPresented.toggle()
                sheetItem = .stone
            }) {
                Text("Stone")
            }
        }.sheet(isPresented: $isPresented) {
            No55_2(item: sheetItem)
        }
    }
}

struct No55_2: View {
    let item: SheetItem
    var body: some View {
        Image(item.rawValue)
            .resizable()
            .frame(width: 150, height: 150)
            .scaledToFit()
    }
}

enum SheetItem: String, Identifiable {
    case cobblestone = "Cobblestone"
    case stone = "Stone"
    var id: Int {
        hashValue
    }
}

struct No55_Previews: PreviewProvider {
    static var previews: some View {
        No55()
    }
}
