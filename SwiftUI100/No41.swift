//
//  No41.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/08.
//

import SwiftUI

struct No41: View {
    
    var body: some View {
        Text(getAttributedString())
    }

    private func getAttributedString() -> AttributedString {
        var attributedString = AttributedString("今なら送料無料！詳しくはこちら")
        let range = attributedString.range(of: "こちら")!
        attributedString[range].link = URL(string: "https://example.com")!
        attributedString[range].foregroundColor = Color.blue
        return attributedString
    }
}

struct No41_Previews: PreviewProvider {
    static var previews: some View {
        No41()
    }
}
