//
//  No62.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/08.
//

import SwiftUI

struct No62: View {
    @State private var isEnable: Bool = true
    var body: some View {
        VStack(spacing: 16) {
            Toggle(isOn: $isEnable) {
                Text("isEnable: \(isEnable.description)")
            }
            Button(action: {
                isEnable.toggle()
            }) {
                Text("Tap(\(isEnable ? "Enable" : "Disable"))")
            }
            .disabled(!isEnable)
        }.padding()
    }
}

struct No62_Previews: PreviewProvider {
    static var previews: some View {
        No62()
    }
}
