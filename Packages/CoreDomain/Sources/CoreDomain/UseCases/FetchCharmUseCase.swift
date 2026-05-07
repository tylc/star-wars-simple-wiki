import CoreModel

public protocol FetchCharmUseCaseProtocol: Sendable {
    func execute(id: MHWIdentifier, projection: String?) async throws -> MHWCharm
}

public final class FetchCharmUseCase: FetchCharmUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: MHWIdentifier, projection: String? = nil) async throws -> MHWCharm {
        try await repository.fetchCharm(id: id, projection: projection)
    }
}
