//
//  No45.swift
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

private struct Spinner: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        return spinner
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}

struct No45: View {
    @State private var repositories: [Repository] = []
    @State private var page = 1
    @State private var isFetching = false
    @State private var subscriptions = Set<AnyCancellable>()
    @State private var isShowingAlert: Bool = false
    @State private var alertEntity: AlertEntity?

    struct AlertEntity {
        let title: String
        let message: String
        let actionText: String
    }

    var body: some View {
        List {
            ForEach(repositories) { repository in
                VStack(alignment: .leading) {
                    Text(repository.name)
                        .font(Font.system(size: 24).bold())
                    Text(repository.description ?? "")
                    Text("Start: \(repository.stargazersCount)")
                }
                .onAppear {
                    if repositories.last == repository {
                        fetchRepositories()
                    }
                }
            }
            if isFetching {
                Spinner()
                    .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
            }
        }
        .onAppear {
            fetchRepositories()
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

    private func fetchRepositories() {
        guard !isFetching else { return }

        isFetching = true
        GitHubAPI.searchRepos(page: page, perPage: 30)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    isFetching = false
                    break
                case let .failure(error):
                    print(error)
                    isFetching = false
                    isShowingAlert.toggle()
                    alertEntity = AlertEntity(title: "通信に失敗しました",
                                              message: "やり直してください",
                                              actionText: "OK")
                }
            }, receiveValue: { repositories in
                self.repositories += repositories
                self.page += 1
            })
            .store(in: &subscriptions)
    }
}

struct No45_Previews: PreviewProvider {
    static var previews: some View {
        No45()
    }
}
