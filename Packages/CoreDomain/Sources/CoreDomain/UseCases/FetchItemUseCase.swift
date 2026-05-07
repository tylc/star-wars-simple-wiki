import CoreModel

public protocol FetchItemUseCaseProtocol: Sendable {
    func execute(id: MHWIdentifier, projection: String?) async throws -> MHWItem
}

public final class FetchItemUseCase: FetchItemUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: MHWIdentifier, projection: String? = nil) async throws -> MHWItem {
        try await repository.fetchItem(id: id, projection: projection)
    }
}
