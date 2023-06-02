//
//  No37.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/02.
//

import SwiftUI

struct No37: View {
    var body: some View {
        TabView {
            Text("a")
            Text("b")
            Text("c")
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct No37_Previews: PreviewProvider {
    static var previews: some View {
        No37()
    }
}
