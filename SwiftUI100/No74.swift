//
//  No74.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

struct No74: View {
    @State private var isPresented: Bool = false
    @State private var text: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Button("Cobblestone") {
                        isPresented.toggle()
                        text = "Cobblestone"
                    }
                    Button("Stone") {
                        isPresented.toggle()
                        text = "Stone"
                    }
                    Button("Smooth Stone") {
                        isPresented.toggle()
                        text = "Smooth Stone"
                    }
                }
                .navigationDestination(isPresented: $isPresented) {
                    Text(text)
                }
            }
        }
    }
}

struct No74_Previews: PreviewProvider {
    static var previews: some View {
        No74()
    }
}
