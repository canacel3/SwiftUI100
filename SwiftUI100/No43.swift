//
//  No43.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import Combine
import SwiftUI

private enum GitHubAPI {
    static func searchRepos(page: Int, perPage: Int) -> AnyPublisher<[Repository], Error> {
        let url = URL(string: "https://api.github.com/search/repositories?q=swift&sort=stars&page=\(page)&per_page=\(perPage)")!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode(GitHubSearchResult.self, from: $0.data).items }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

private struct GitHubSearchResult: Codable {
    let items: [Repository]
}

private struct Repository: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let description: String?
    let stargazersCount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case stargazersCount = "stargazers_count"
    }
}

struct No43: View {
    @State private var repositories: [Repository] = []
    @State private var subscriptions = Set<AnyCancellable>()
    @State private var isShowingAlert: Bool = false
    @State private var alertEntity: AlertEntity?
    struct AlertEntity {
        let title: String
        let message: String
        let actionText: String
    }

    var body: some View {
        List(repositories) { repository in
            VStack(alignment: .leading) {
                Text(repository.name)
                    .font(Font.system(size: 24).bold())
                Text(repository.description ?? "")
                Text("Start: \(repository.stargazersCount)")
            }
        }.onAppear {
            GitHubAPI.searchRepos(page: 1, perPage: 30)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case let .failure(error):
                        print(error)
                        isShowingAlert.toggle()
                        alertEntity = AlertEntity(title: "通信に失敗しました",
                                                  message: "やり直してください",
                                                  actionText: "OK")
                    }
                }, receiveValue: { repositories in
                    self.repositories = repositories
                })
                .store(in: &subscriptions)
        }
        .alert(alertEntity?.title ?? "",
                isPresented: $isShowingAlert,
                presenting: alertEntity) { entity in
            Button(entity.actionText) {
                print(entity.actionText)
            }
        } message: { entity in
            Text(entity.message)
        }
    }
}

struct No43_Previews: PreviewProvider {
    static var previews: some View {
        No43()
    }
}
