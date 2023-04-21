//
//  No6.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/04/21.
//

import SwiftUI

struct No6: View {
    var body: some View {
        NavigationStack {
            Image("cat")
                .resizable()
                .frame(width: 150, height: 150)
                .navigationTitle("No.6")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct No6_Previews: PreviewProvider {
    static var previews: some View {
        No6()
    }
}
