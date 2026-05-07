import CoreModel

public protocol FetchMonsterUseCaseProtocol: Sendable {
    func execute(id: MHWIdentifier, projection: String?) async throws -> MHWMonster
}

public final class FetchMonsterUseCase: FetchMonsterUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: MHWIdentifier, projection: String? = nil) async throws -> MHWMonster {
        try await repository.fetchMonster(id: id, projection: projection)
    }
}
