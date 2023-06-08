//
//  No42.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

private enum GitHubAPI {
    static func searchRepos(page: Int, perPage: Int, completion: @escaping (Result<[Repository], Error>) -> Void) {
        let url = URL(string: "https://api.github.com/search/repositories?q=swift&sort=stars&page=\(page)&per_page=\(perPage)")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(Result.failure(error))
                return
            }
            do {
                let repositories = try JSONDecoder().decode(GitHubSearchResult.self, from: data!).items
                completion(Result.success(repositories))
            } catch let error {
                completion(Result.failure(error))
            }
        }
        task.resume()
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

struct No42: View {
    @State private var repositories: [Repository] = []
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
            GitHubAPI.searchRepos(page: 1, perPage: 30) { result in
                switch result {
                case let .success(repositories):
                    DispatchQueue.main.async {
                        self.repositories = repositories
                    }
                case let .failure(error):
                    print(error)
                    alertEntity = AlertEntity(title: "通信に失敗しました",
                                              message: "やり直してください",
                                              actionText: "OK")
                    isShowingAlert.toggle()
                }
            }
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

struct No42_Previews: PreviewProvider {
    static var previews: some View {
        No42()
    }
}
