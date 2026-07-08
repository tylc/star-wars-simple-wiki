import CoreModel

public protocol FetchAilmentsUseCaseProtocol: Sendable {
    func execute(query: String?, projection: String?) async throws -> [MHWAilment]
}

public final class FetchAilmentsUseCase: FetchAilmentsUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(query: String? = nil, projection: String? = nil) async throws -> [MHWAilment] {
        try await repository.fetchAilments(query: query, projection: projection)
    }
}
