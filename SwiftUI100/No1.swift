//
//  No1.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/03/29.
//

import SwiftUI

struct No1: View {
    var body: some View {
        Image("music_cembalo_jpg")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 200)
            .background(Color.red)
        
    }
}

struct No1_Previews: PreviewProvider {
    static var previews: some View {
        No1()
    }
}
