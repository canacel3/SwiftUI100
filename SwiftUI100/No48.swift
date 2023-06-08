//
//  No48.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/08.
//

import SwiftUI

struct No48: View {
    @AppStorage("FAVORITE_POKEMON_NAME") var favoritePokemonName: String = ""
    var body: some View {
        VStack(spacing: 16) {
            Text("Your Favorite Pokemon is... \(favoritePokemonName)")
            Button("Darkrai") {
                favoritePokemonName = "Darkrai"
            }
            Button("Gardevoir") {
                favoritePokemonName = "Gardevoir"
            }
        }
    }
}

struct No48_Previews: PreviewProvider {
    static var previews: some View {
        No48()
    }
}
