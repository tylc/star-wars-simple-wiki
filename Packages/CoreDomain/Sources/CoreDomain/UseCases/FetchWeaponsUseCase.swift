import CoreModel

public protocol FetchWeaponsUseCaseProtocol: Sendable {
    func execute(query: String?, projection: String?) async throws -> [MHWWeapon]
}

public final class FetchWeaponsUseCase: FetchWeaponsUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(query: String? = nil, projection: String? = nil) async throws -> [MHWWeapon] {
        try await repository.fetchWeapons(query: query, projection: projection)
    }
}
