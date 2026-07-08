import CoreModel

public protocol FetchMonstersUseCaseProtocol: Sendable {
    func execute(query: String?, projection: String?) async throws -> [MHWMonster]
}

public final class FetchMonstersUseCase: FetchMonstersUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(query: String? = nil, projection: String? = nil) async throws -> [MHWMonster] {
        try await repository.fetchMonsters(query: query, projection: projection)
    }
}
