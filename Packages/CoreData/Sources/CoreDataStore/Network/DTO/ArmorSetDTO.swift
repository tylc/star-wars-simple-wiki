import CoreModel

public struct ArmorSetDTO: Codable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let rank: MHWRank?
    public let pieces: [ArmorDTO]?
    public let bonus: ArmorSetBonusDTO?

    func toModel() throws -> MHWArmorSet {
        try DTOMapper.map(self, to: MHWArmorSet.self)
    }
}
