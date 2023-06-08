//
//  No64.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/08.
//

import SwiftUI

struct No64: View {
    @State private var path: [Int] = []
    var body: some View {
        NavigationStack(path: $path) {
            Button("Start") {
                path.append(1)
            }
            .navigationDestination(for: Int.self) { int in
                No64_2(path: $path, count: int)
            }
        }
    }
}

struct No64_2: View {
    @Binding var path: [Int]
    let count: Int
    var body: some View {
        Button("Go Deeper") {
            path.append(count + 1)
        }
        .navigationTitle(count.description)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Pop to Root") {
                    path = []
                }
            }
        }
    }
}


struct No64_Previews: PreviewProvider {
    static var previews: some View {
        No64()
    }
}
