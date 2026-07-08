import CoreModel

public protocol FetchArmorSetUseCaseProtocol: Sendable {
    func execute(id: MHWIdentifier, projection: String?) async throws -> MHWArmorSet
}

public final class FetchArmorSetUseCase: FetchArmorSetUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: MHWIdentifier, projection: String? = nil) async throws -> MHWArmorSet {
        try await repository.fetchArmorSet(id: id, projection: projection)
    }
}
