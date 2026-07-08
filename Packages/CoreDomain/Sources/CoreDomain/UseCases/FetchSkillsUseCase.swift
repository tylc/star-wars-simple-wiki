import CoreModel

public protocol FetchSkillsUseCaseProtocol: Sendable {
    func execute(query: String?, projection: String?) async throws -> [MHWSkill]
}

public final class FetchSkillsUseCase: FetchSkillsUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(query: String? = nil, projection: String? = nil) async throws -> [MHWSkill] {
        try await repository.fetchSkills(query: query, projection: projection)
    }
}
