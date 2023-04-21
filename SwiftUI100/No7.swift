//
//  No7.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/04/21.
//

import SwiftUI

struct No7: View {
    @State var pickerIndex: Int = 0
    var body: some View {
        Picker("", selection: $pickerIndex) {
            Text("ぴかちゅう").tag(0)
            Text("こだっく").tag(1)
            Text("らぷらす").tag(2)
        }.pickerStyle(.wheel)
    }
}

struct No7_Previews: PreviewProvider {
    static var previews: some View {
        No7()
    }
}
