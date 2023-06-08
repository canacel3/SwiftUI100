//
//  No63.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/08.
//

import SwiftUI

struct No63: View {
    @State private var numberString: String = ""
    var body: some View {
        TextField("Placeholder", text: $numberString)
            .keyboardType(.decimalPad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}

struct No63_Previews: PreviewProvider {
    static var previews: some View {
        No63()
    }
}
