import CoreModel

public protocol FetchArmorSetsUseCaseProtocol: Sendable {
    func execute(query: String?, projection: String?) async throws -> [MHWArmorSet]
}

public final class FetchArmorSetsUseCase: FetchArmorSetsUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(query: String? = nil, projection: String? = nil) async throws -> [MHWArmorSet] {
        try await repository.fetchArmorSets(query: query, projection: projection)
    }
}
