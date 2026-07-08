import CoreModel

public protocol FetchAilmentUseCaseProtocol: Sendable {
    func execute(id: MHWIdentifier, projection: String?) async throws -> MHWAilment
}

public final class FetchAilmentUseCase: FetchAilmentUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: MHWIdentifier, projection: String? = nil) async throws -> MHWAilment {
        try await repository.fetchAilment(id: id, projection: projection)
    }
}
