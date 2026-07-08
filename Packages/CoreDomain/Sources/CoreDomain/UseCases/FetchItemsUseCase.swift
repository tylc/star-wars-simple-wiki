import CoreModel

public protocol FetchItemsUseCaseProtocol: Sendable {
    func execute(query: String?, projection: String?) async throws -> [MHWItem]
}

public final class FetchItemsUseCase: FetchItemsUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(query: String? = nil, projection: String? = nil) async throws -> [MHWItem] {
        try await repository.fetchItems(query: query, projection: projection)
    }
}
