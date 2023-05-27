//
//  No22.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

struct No22: View {
    var body: some View {
        Text("I am a ")
            + Text("Queencard")
                .fontWeight(.bold)
                .foregroundColor(Color.pink)
            + Text("\n")
            + Text("You wanna be the ")
            + Text("Queencard")
                .fontWeight(.bold)
                .foregroundColor(Color.pink)
            + Text("?")
        
    }
}

struct No22_Previews: PreviewProvider {
    static var previews: some View {
        No22()
    }
}
