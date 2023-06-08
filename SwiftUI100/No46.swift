//
//  No46.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/08.
//

import SwiftUI

struct No46: View {
    @State var text: String = ""
    @State var onEditing: Bool = false
    var body: some View {
        VStack {
            Text(onEditing ? "On Editing" : "Not Editing")
            TextField("Placeholder", text: $text, onEditingChanged: { onEditing in
                self.onEditing = onEditing
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        }
    }
}

struct No46_Previews: PreviewProvider {
    static var previews: some View {
        No46()
    }
}
