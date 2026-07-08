import CoreModel

public protocol FetchLocationsUseCaseProtocol: Sendable {
    func execute(query: String?, projection: String?) async throws -> [MHWLocation]
}

public final class FetchLocationsUseCase: FetchLocationsUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(query: String? = nil, projection: String? = nil) async throws -> [MHWLocation] {
        try await repository.fetchLocations(query: query, projection: projection)
    }
}
