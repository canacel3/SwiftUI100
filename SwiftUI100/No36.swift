//
//  No36.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/02.
//

import SwiftUI

struct No36: View {
    @State var isPresented = true
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.navigationDestination(isPresented: $isPresented) {
            Text("2")
        }
    }
}

struct No36_Previews: PreviewProvider {
    static var previews: some View {
        No36()
    }
}
