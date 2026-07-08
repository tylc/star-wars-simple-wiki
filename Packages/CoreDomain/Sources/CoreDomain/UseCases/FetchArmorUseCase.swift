import CoreModel

public protocol FetchArmorUseCaseProtocol: Sendable {
    func execute(query: String?, projection: String?) async throws -> [MHWArmor]
}

public final class FetchArmorUseCase: FetchArmorUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(query: String? = nil, projection: String? = nil) async throws -> [MHWArmor] {
        try await repository.fetchArmor(query: query, projection: projection)
    }
}
