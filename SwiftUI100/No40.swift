//
//  No40.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/08.
//

import SwiftUI

struct No40: View {
    @State private var isPresented = false
    var body: some View {
        Button(action: {
            isPresented.toggle()
        }) {
            Text("Tap")
        }.fullScreenCover(isPresented: $isPresented) {
            No40_2()
        }
    }
}

struct No40_2: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button(action: {
            dismiss()
        }) {
            Text("Close")
        }
    }
}

struct No40_Previews: PreviewProvider {
    static var previews: some View {
        No40()
    }
}
