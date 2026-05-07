import CoreModel

public protocol FetchEventUseCaseProtocol: Sendable {
    func execute(id: MHWIdentifier, projection: String?) async throws -> MHWEvent
}

public final class FetchEventUseCase: FetchEventUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: MHWIdentifier, projection: String? = nil) async throws -> MHWEvent {
        try await repository.fetchEvent(id: id, projection: projection)
    }
}
