//
//  No13.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

struct No13: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Cobblestone", value: "Cobblestone")
                NavigationLink("Stone", value: "Stone")
                NavigationLink("SmoothStone", value: "SmoothStone")
            }
            .listStyle(.plain)
        }
    }
}

struct No13_Previews: PreviewProvider {
    static var previews: some View {
        No13()
    }
}
