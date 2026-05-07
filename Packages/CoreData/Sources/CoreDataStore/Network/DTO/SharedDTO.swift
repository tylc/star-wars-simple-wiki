import CoreModel

public struct ElementResistancesDTO: Codable, Sendable {
    public let fire: Int?
    public let water: Int?
    public let ice: Int?
    public let thunder: Int?
    public let dragon: Int?
}

public struct SlotDTO: Codable, Sendable {
    public let rank: Int?
}

public struct SkillRankDTO: Codable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let skill: MHWIdentifier?
    public let skillName: String?
    public let level: Int?
    public let description: String?
    public let modifiers: JSONValue?
}

public struct CharmRankDTO: Codable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let level: Int?
    public let rarity: Int?
    public let skills: [SkillRankDTO]?
    public let crafting: CraftingInfoDTO?
}

public struct ArmorSetBonusDTO: Codable, Sendable {
    public let id: MHWIdentifier?
    public let name: String?
    public let ranks: [SkillRankDTO]?
}

public struct CraftingInfoDTO: Codable, Sendable {
    public let craftable: Bool?
    public let materials: [CraftingCostDTO]?
}

public struct CraftingCostDTO: Codable, Sendable {
    public let quantity: Int?
    public let item: ItemDTO?
}
