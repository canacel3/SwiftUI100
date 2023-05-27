//
//  No20.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

struct No20: View {
    @State private var isPresented: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    Text("Tap")
                })
            }
            .navigationDestination(isPresented: $isPresented) {
                EmptyView()
            }
        }
    }
}

struct No20_Previews: PreviewProvider {
    static var previews: some View {
        No20()
    }
}
