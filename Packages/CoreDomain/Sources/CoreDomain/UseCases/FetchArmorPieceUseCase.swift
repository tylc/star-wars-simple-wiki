import CoreModel

public protocol FetchArmorPieceUseCaseProtocol: Sendable {
    func execute(id: MHWIdentifier, projection: String?) async throws -> MHWArmor
}

public final class FetchArmorPieceUseCase: FetchArmorPieceUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: MHWIdentifier, projection: String? = nil) async throws -> MHWArmor {
        try await repository.fetchArmorPiece(id: id, projection: projection)
    }
}
