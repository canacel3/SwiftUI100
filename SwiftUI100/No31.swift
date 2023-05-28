//
//  No31.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/28.
//

import SwiftUI

struct No31: View {
    @State private var isPresentedSheet: Bool = false
    var body: some View {
        Button(action: {
            isPresentedSheet.toggle()
        }) {
            Text("Tap")
        }.fullScreenCover(isPresented: $isPresentedSheet) {
            EmptyView().background(Color.red)
        }
    }
}

struct No31_Previews: PreviewProvider {
    static var previews: some View {
        No31()
    }
}
