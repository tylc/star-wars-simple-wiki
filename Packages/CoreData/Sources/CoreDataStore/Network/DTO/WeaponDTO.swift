import Foundation
import CoreModel

public struct WeaponDTO: Codable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let type: String?
    public let rarity: Int?
    public let attack: AttackDTO?
    public let elderseal: String?
    public let damageType: String?
    public let durability: [DurabilityDTO]?
    public let slots: [SlotDTO]?
    public let elements: [WeaponElementDTO]?
    public let crafting: WeaponCraftingDTO?
    public let assets: WeaponAssetsDTO?

    public struct AttackDTO: Codable, Sendable {
        public let display: Int?
        public let raw: Int?
    }

    public struct DurabilityDTO: Codable, Sendable {
        public let red: Int?
        public let orange: Int?
        public let yellow: Int?
        public let green: Int?
        public let blue: Int?
        public let white: Int?
        public let purple: Int?
    }

    public struct WeaponElementDTO: Codable, Sendable {
        public let type: MHWElement?
        public let damage: Int?
        public let hidden: Bool?
    }

    public struct WeaponCraftingDTO: Codable, Sendable {
        public let craftable: Bool?
        public let previous: MHWIdentifier?
        public let branches: [MHWIdentifier]?
        public let craftingMaterials: [CraftingCostDTO]?
        public let upgradeMaterials: [CraftingCostDTO]?
    }

    public struct WeaponAssetsDTO: Codable, Sendable {
        public let icon: URL?
        public let image: URL?
    }

    func toModel() throws -> MHWWeapon {
        try DTOMapper.map(self, to: MHWWeapon.self)
    }
}
