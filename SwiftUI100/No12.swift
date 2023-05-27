//
//  No12.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

struct No12: View {
    private let stones = ["Cobblestone", "Stone", "SmoothStone"]
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Cobblestone", value: "Cobblestone")
                NavigationLink("Stone", value: "Stone")
                NavigationLink("SmoothStone", value: "SmoothStone")
            }
            .navigationDestination(for: String.self) { stone in
                No12_2(textString: stone)
            }
        }
    }
}

struct No12_Previews: PreviewProvider {
    static var previews: some View {
        No12()
    }
}
