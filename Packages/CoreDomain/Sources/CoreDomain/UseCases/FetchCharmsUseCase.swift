import CoreModel

public protocol FetchCharmsUseCaseProtocol: Sendable {
    func execute(query: String?, projection: String?) async throws -> [MHWCharm]
}

public final class FetchCharmsUseCase: FetchCharmsUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(query: String? = nil, projection: String? = nil) async throws -> [MHWCharm] {
        try await repository.fetchCharms(query: query, projection: projection)
    }
}
