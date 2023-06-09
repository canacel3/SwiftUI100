//
//  No88.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

private struct Cat: Identifiable {
    let id: String
    let image: UIImage
}

private struct CatResponse: Codable {
    let id: String
    let url: URL
    let width: Int
    let height: Int

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case width
        case height
    }
}

struct No88: View {
    @State private var cats: [Cat] = []

    var body: some View {
        VStack {
            ForEach(cats) { cat in
                HStack {
                    Image(uiImage: cat.image)
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text(cat.id)
                }
            }
        }
        .task {
            guard let cats = try? await fetchCat() else { return }
            await MainActor.run {
                self.cats = cats
            }
        }
    }

    private func fetchCat() async throws -> [Cat] {
        let url = URL(string: "https://api.thecatapi.com/v1/images/search")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let responses = try JSONDecoder().decode([CatResponse].self, from: data)
        var cats: [Cat] = []
        for response in responses {
            let imageURL = response.url
            let (data, _) = try await URLSession.shared.data(from: imageURL)
            let image = UIImage(data: data)!
            let cat = Cat(id: response.id, image: image)
            cats.append(cat)
        }
        return cats
    }
}

struct No88_Previews: PreviewProvider {
    static var previews: some View {
        No88()
    }
}
