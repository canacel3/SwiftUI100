//
//  No76.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

struct No76: View {
    let items = [
        Item(name: "Stone", stack: 64),
        Item(name: "Ender Pearl", stack: 16),
        Item(name: "Water Bucket", stack: 1)
    ]
    var body: some View {
        List(items, id: \.name) { item in
            Text(item.name)
        }
    }
}

struct Item {
    let name: String
    let stack: Int
}

struct No76_Previews: PreviewProvider {
    static var previews: some View {
        No76()
    }
}
