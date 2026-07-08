import CoreModel

public protocol FetchMotionValueUseCaseProtocol: Sendable {
    func execute(id: MHWIdentifier, projection: String?) async throws -> MHWMotionValue
}

public final class FetchMotionValueUseCase: FetchMotionValueUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: MHWIdentifier, projection: String? = nil) async throws -> MHWMotionValue {
        try await repository.fetchMotionValue(id: id, projection: projection)
    }
}
