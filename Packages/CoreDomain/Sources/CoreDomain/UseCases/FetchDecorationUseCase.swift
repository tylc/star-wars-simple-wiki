import CoreModel

public protocol FetchDecorationUseCaseProtocol: Sendable {
    func execute(id: MHWIdentifier, projection: String?) async throws -> MHWDecoration
}

public final class FetchDecorationUseCase: FetchDecorationUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: MHWIdentifier, projection: String? = nil) async throws -> MHWDecoration {
        try await repository.fetchDecoration(id: id, projection: projection)
    }
}
