import CoreModel

public struct SkillDTO: Codable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let description: String?
    public let ranks: [SkillRankDTO]?

    func toModel() throws -> MHWSkill {
        try DTOMapper.map(self, to: MHWSkill.self)
    }
}
