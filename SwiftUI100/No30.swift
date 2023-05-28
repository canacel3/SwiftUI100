//
//  No30.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/28.
//

import SwiftUI

struct No30: View {
    @State private var isPresentedSheet: Bool = false
    var body: some View {
        Button(action: {
            isPresentedSheet.toggle()
        }) {
            Text("Tap")
        }.sheet(isPresented: $isPresentedSheet) {
            EmptyView()
        }
    }
}

struct No30_Previews: PreviewProvider {
    static var previews: some View {
        No30()
    }
}
