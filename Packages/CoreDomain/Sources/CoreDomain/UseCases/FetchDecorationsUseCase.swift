import CoreModel

public protocol FetchDecorationsUseCaseProtocol: Sendable {
    func execute(query: String?, projection: String?) async throws -> [MHWDecoration]
}

public final class FetchDecorationsUseCase: FetchDecorationsUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(query: String? = nil, projection: String? = nil) async throws -> [MHWDecoration] {
        try await repository.fetchDecorations(query: query, projection: projection)
    }
}
