import CoreModel

public protocol FetchLocationUseCaseProtocol: Sendable {
    func execute(id: MHWIdentifier, projection: String?) async throws -> MHWLocation
}

public final class FetchLocationUseCase: FetchLocationUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: MHWIdentifier, projection: String? = nil) async throws -> MHWLocation {
        try await repository.fetchLocation(id: id, projection: projection)
    }
}
