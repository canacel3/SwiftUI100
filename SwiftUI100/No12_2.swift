//
//  No12_2.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

struct No12_2: View {
    var textString: String
    var body: some View {
        Text(textString)
            .navigationBarBackButtonHidden()
    }
}

struct No12_2_Previews: PreviewProvider {
    static var previews: some View {
        No12_2(textString: "")
    }
}
