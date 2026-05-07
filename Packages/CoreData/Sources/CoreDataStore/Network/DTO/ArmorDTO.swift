import Foundation
import CoreModel

public struct ArmorDTO: Codable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let type: String?
    public let rank: MHWRank?
    public let rarity: Int?
    public let defense: DefenseDTO?
    public let resistances: ElementResistancesDTO?
    public let slots: [SlotDTO]?
    public let skills: [SkillRankDTO]?
    public let armorSet: ArmorSetReference?
    public let assets: ArmorAssetsDTO?
    public let crafting: ArmorCraftingDTO?

    public struct DefenseDTO: Codable, Sendable {
        public let base: Int?
        public let max: Int?
        public let augmented: Int?
    }

    public struct ArmorAssetsDTO: Codable, Sendable {
        public let imageMale: URL?
        public let imageFemale: URL?
    }

    public struct ArmorCraftingDTO: Codable, Sendable {
        public let materials: [CraftingCostDTO]?
    }

    func toModel() throws -> MHWArmor {
        try DTOMapper.map(self, to: MHWArmor.self)
    }
}
