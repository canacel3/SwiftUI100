//
//  No38.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/02.
//

import SwiftUI

struct No38: View {
    @State private var isPresented = false
    var body: some View {
        Button(action: {
            isPresented.toggle()
            
        }), label: {
            Text("Tap!")
        }.sheet(isPresented: $isPresented {
            EmptyView()
        }
    }
}

struct No38_Previews: PreviewProvider {
    static var previews: some View {
        No38()
    }
}
