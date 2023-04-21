//
//  No5.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/04/21.
//

import SwiftUI

struct No5: View {
    var body: some View {
        HStack(spacing: 30) {
            Image("cat")
                .resizable()
                .frame(width: 50, height: 50)
            Image("cat")
                .resizable()
                .frame(width: 50, height: 50)
            Image("cat")
                .resizable()
                .frame(width: 50, height: 50)
            Image("cat")
                .resizable()
                .frame(width: 50, height: 50)
        }
    }
}

struct No5_Previews: PreviewProvider {
    static var previews: some View {
        No5()
    }
}
