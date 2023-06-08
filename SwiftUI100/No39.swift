//
//  No39.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/08.
//

import SwiftUI

struct No39: View {
    @State private var isPresentedModal = false
    @State private var isPresentedFullModal = false
    var body: some View {
        Button(action: {
            isPresentedModal.toggle()
        }) {
            Text("Modal Open")
        }.sheet(isPresented: $isPresentedModal) {
            Button(action: {
                isPresentedFullModal.toggle()
            }) {
                Text("Full Modal Open")
            }.fullScreenCover(isPresented: $isPresentedFullModal) {
                Text("Full Modal!")
            }
        }
    }
}

struct No39_Previews: PreviewProvider {
    static var previews: some View {
        No39()
    }
}
