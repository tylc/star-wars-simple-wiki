import CoreModel

public protocol FetchWeaponUseCaseProtocol: Sendable {
    func execute(id: MHWIdentifier, projection: String?) async throws -> MHWWeapon
}

public final class FetchWeaponUseCase: FetchWeaponUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: MHWIdentifier, projection: String? = nil) async throws -> MHWWeapon {
        try await repository.fetchWeapon(id: id, projection: projection)
    }
}
