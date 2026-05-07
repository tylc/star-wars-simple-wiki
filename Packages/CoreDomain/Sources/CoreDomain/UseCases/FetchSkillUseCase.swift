import CoreModel

public protocol FetchSkillUseCaseProtocol: Sendable {
    func execute(id: MHWIdentifier, projection: String?) async throws -> MHWSkill
}

public final class FetchSkillUseCase: FetchSkillUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: MHWIdentifier, projection: String? = nil) async throws -> MHWSkill {
        try await repository.fetchSkill(id: id, projection: projection)
    }
}
