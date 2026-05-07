import CoreModel

public struct DecorationDTO: Codable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let rarity: Int?
    public let slot: Int?
    public let skills: [SkillRankDTO]?

    func toModel() throws -> MHWDecoration {
        try DTOMapper.map(self, to: MHWDecoration.self)
    }
}
