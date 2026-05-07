import CoreModel

public protocol FetchMotionValuesUseCaseProtocol: Sendable {
    func execute(query: String?, projection: String?) async throws -> [MHWMotionValue]
    func execute(weaponType: String, query: String?, projection: String?) async throws -> [MHWMotionValue]
}

public final class FetchMotionValuesUseCase: FetchMotionValuesUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(query: String? = nil, projection: String? = nil) async throws -> [MHWMotionValue] {
        try await repository.fetchMotionValues(query: query, projection: projection)
    }

    public func execute(weaponType: String, query: String? = nil, projection: String? = nil) async throws -> [MHWMotionValue] {
        try await repository.fetchMotionValues(weaponType: weaponType, query: query, projection: projection)
    }
}
