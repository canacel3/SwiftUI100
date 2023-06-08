//
//  No51.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

struct No51: View {
    var body: some View {
        Image("cat")
            .resizable()
            .frame(width: 200, height: 200)
            .contextMenu {
                Button(action: {
                    print("Cute")
                }) {
                    Text("Cute")
                    Image(systemName: "heart")
                }
            }
    }
}

struct No51_Previews: PreviewProvider {
    static var previews: some View {
        No51()
    }
}
