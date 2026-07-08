import Foundation

public typealias MHWIdentifier = Int

public enum MHWRank: String, Codable, Sendable {
    case low
    case high
    case master
    case unknown

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self = MHWRank(rawValue: (try? container.decode(String.self)) ?? "") ?? .unknown
    }
}

public enum MHWElement: String, Codable, Sendable {
    case fire
    case water
    case ice
    case thunder
    case dragon
    case poison
    case sleep
    case paralysis
    case blast
    case stun
    case unknown

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self = MHWElement(rawValue: (try? container.decode(String.self)) ?? "") ?? .unknown
    }
}

public struct MHWNamedResource: Codable, Hashable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let description: String?

    public init(id: MHWIdentifier, name: String, description: String? = nil) {
        self.id = id
        self.name = name
        self.description = description
    }
}

public struct MHWItem: Codable, Hashable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let description: String?
    public let rarity: Int?
    public let carryLimit: Int?
    public let value: Int?
    public let sellPrice: Int?
    public let buyPrice: Int?

    public init(
        id: MHWIdentifier,
        name: String,
        description: String? = nil,
        rarity: Int? = nil,
        carryLimit: Int? = nil,
        value: Int? = nil,
        sellPrice: Int? = nil,
        buyPrice: Int? = nil
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.rarity = rarity
        self.carryLimit = carryLimit
        self.value = value
        self.sellPrice = sellPrice
        self.buyPrice = buyPrice
    }
}

public struct MHWAilment: Codable, Hashable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let description: String?
    public let recovery: Recovery?
    public let protection: Protection?

    public struct Recovery: Codable, Hashable, Sendable {
        public let actions: [String]?
        public let items: [MHWItem]?
    }

    public struct Protection: Codable, Hashable, Sendable {
        public let items: [MHWItem]?
        public let skills: [MHWNamedResource]?
    }
}

public struct MHWMonster: Codable, Hashable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let type: String?
    public let species: String?
    public let description: String?
    public let elements: [String]?
    public let ailments: [MHWNamedResource]?
    public let locations: [MHWNamedResource]?
    public let resistances: [Resistance]?
    public let weaknesses: [Weakness]?
    public let rewards: [Reward]?

    public init(
        id: MHWIdentifier,
        name: String,
        type: String? = nil,
        species: String? = nil,
        description: String? = nil,
        elements: [String]? = nil,
        ailments: [MHWNamedResource]? = nil,
        locations: [MHWNamedResource]? = nil,
        resistances: [Resistance]? = nil,
        weaknesses: [Weakness]? = nil,
        rewards: [Reward]? = nil
    ) {
        self.id = id
        self.name = name
        self.type = type
        self.species = species
        self.description = description
        self.elements = elements
        self.ailments = ailments
        self.locations = locations
        self.resistances = resistances
        self.weaknesses = weaknesses
        self.rewards = rewards
    }

    public struct Resistance: Codable, Hashable, Sendable {
        public let element: MHWElement?
        public let condition: String?

        public init(element: MHWElement? = nil, condition: String? = nil) {
            self.element = element
            self.condition = condition
        }
    }

    public struct Weakness: Codable, Hashable, Sendable {
        public let element: MHWElement?
        public let stars: Int?
        public let condition: String?

        public init(element: MHWElement? = nil, stars: Int? = nil, condition: String? = nil) {
            self.element = element
            self.stars = stars
            self.condition = condition
        }
    }

    public struct Reward: Codable, Hashable, Sendable {
        public let id: MHWIdentifier?
        public let item: MHWItem?
        public let conditions: [MHWRewardCondition]?

        public init(id: MHWIdentifier? = nil, item: MHWItem? = nil, conditions: [MHWRewardCondition]? = nil) {
            self.id = id
            self.item = item
            self.conditions = conditions
        }
    }
}

public struct MHWArmor: Codable, Hashable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let type: String?
    public let rank: MHWRank?
    public let rarity: Int?
    public let defense: Defense?
    public let resistances: ElementResistances?
    public let slots: [Slot]?
    public let skills: [SkillRank]?
    public let armorSet: ArmorSetReference?
    public let assets: ArmorAssets?
    public let crafting: ArmorCrafting?

    public struct Defense: Codable, Hashable, Sendable {
        public let base: Int?
        public let max: Int?
        public let augmented: Int?
    }

    public struct SetInfo: Codable, Hashable, Sendable {
        public let id: MHWIdentifier?
        public let name: String?
        public let rank: MHWRank?
        public let pieces: [MHWIdentifier]?
    }

    public struct ArmorAssets: Codable, Hashable, Sendable {
        public let imageMale: URL?
        public let imageFemale: URL?
    }

    public struct ArmorCrafting: Codable, Hashable, Sendable {
        public let materials: [CraftingCost]?
    }
}

public struct MHWArmorSet: Codable, Hashable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let rank: MHWRank?
    public let pieces: [MHWArmor]?
    public let bonus: ArmorSetBonus?
}

public struct MHWCharm: Codable, Hashable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let ranks: [CharmRank]?
}

public struct MHWDecoration: Codable, Hashable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let rarity: Int?
    public let slot: Int?
    public let skills: [SkillRank]?
}

public struct MHWEvent: Codable, Hashable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let platform: String?
    public let exclusive: Bool?
    public let type: String?
    public let expansion: String?
    public let description: String?
    public let requirements: String?
    public let questRank: Int?
    public let startTimestamp: String?
    public let endTimestamp: String?
}

public struct MHWLocation: Codable, Hashable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let zoneCount: Int?
    public let camps: [Camp]?

    public struct Camp: Codable, Hashable, Sendable {
        public let id: MHWIdentifier?
        public let name: String?
        public let zone: Int?
    }
}

public struct MHWSkill: Codable, Hashable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let description: String?
    public let ranks: [SkillRank]?
}

public struct MHWWeapon: Codable, Hashable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let type: String?
    public let rarity: Int?
    public let attack: Attack?
    public let elderseal: String?
    public let damageType: String?
    public let durability: [Durability]?
    public let slots: [Slot]?
    public let elements: [WeaponElement]?
    public let crafting: WeaponCrafting?
    public let assets: WeaponAssets?

    public struct Attack: Codable, Hashable, Sendable {
        public let display: Int?
        public let raw: Int?
    }

    public struct Durability: Codable, Hashable, Sendable {
        public let red: Int?
        public let orange: Int?
        public let yellow: Int?
        public let green: Int?
        public let blue: Int?
        public let white: Int?
        public let purple: Int?
    }

    public struct WeaponElement: Codable, Hashable, Sendable {
        public let type: MHWElement?
        public let damage: Int?
        public let hidden: Bool?
    }

    public struct WeaponCrafting: Codable, Hashable, Sendable {
        public let craftable: Bool?
        public let previous: MHWIdentifier?
        public let branches: [MHWIdentifier]?
        public let craftingMaterials: [CraftingCost]?
        public let upgradeMaterials: [CraftingCost]?
    }

    public struct WeaponAssets: Codable, Hashable, Sendable {
        public let icon: URL?
        public let image: URL?
    }
}

public struct MHWMotionValue: Codable, Hashable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let weaponType: String?
    public let damageType: String?
    public let stun: Int?
    public let exhaust: Int?
    public let hits: [Hit]?

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(MHWIdentifier.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        weaponType = try container.decodeIfPresent(String.self, forKey: .weaponType)
        damageType = try container.decodeIfPresent(String.self, forKey: .damageType)
        stun = try container.decodeIfPresent(Int.self, forKey: .stun)
        exhaust = try container.decodeIfPresent(Int.self, forKey: .exhaust)
        hits = try container.decodeIfPresent([Hit].self, forKey: .hits)
            ?? container.decodeIfPresent([Hit].self, forKey: .values)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case weaponType
        case damageType
        case stun
        case exhaust
        case hits
        case values
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(weaponType, forKey: .weaponType)
        try container.encodeIfPresent(damageType, forKey: .damageType)
        try container.encodeIfPresent(stun, forKey: .stun)
        try container.encodeIfPresent(exhaust, forKey: .exhaust)
        try container.encodeIfPresent(hits, forKey: .hits)
    }

    public struct Hit: Codable, Hashable, Sendable {
        public let damage: Int?

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let damage = try? container.decode(Int.self) {
                self.damage = damage
            } else {
                let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
                self.damage = try keyedContainer.decodeIfPresent(Int.self, forKey: .damage)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(damage)
        }

        private enum CodingKeys: String, CodingKey {
            case damage
        }
    }
}

public enum ArmorSetReference: Codable, Hashable, Sendable {
    case id(MHWIdentifier)
    case info(MHWArmor.SetInfo)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let id = try? container.decode(MHWIdentifier.self) {
            self = .id(id)
        } else {
            self = .info(try container.decode(MHWArmor.SetInfo.self))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .id(id):
            try container.encode(id)
        case let .info(info):
            try container.encode(info)
        }
    }
}

public struct ElementResistances: Codable, Hashable, Sendable {
    public let fire: Int?
    public let water: Int?
    public let ice: Int?
    public let thunder: Int?
    public let dragon: Int?
}

public struct Slot: Codable, Hashable, Sendable {
    public let rank: Int?
}

public struct SkillRank: Codable, Hashable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let skill: MHWIdentifier?
    public let skillName: String?
    public let level: Int?
    public let description: String?
    public let modifiers: JSONValue?
}

public struct CharmRank: Codable, Hashable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let level: Int?
    public let rarity: Int?
    public let skills: [SkillRank]?
    public let crafting: CraftingInfo?
}

public struct ArmorSetBonus: Codable, Hashable, Sendable {
    public let id: MHWIdentifier?
    public let name: String?
    public let ranks: [SkillRank]?
}

public struct CraftingInfo: Codable, Hashable, Sendable {
    public let craftable: Bool?
    public let materials: [CraftingCost]?
}

public struct CraftingCost: Codable, Hashable, Sendable {
    public let quantity: Int?
    public let item: MHWItem?
}

public struct MHWRewardCondition: Codable, Hashable, Sendable {
    public let type: String?
    public let rank: MHWRank?
    public let quantity: Int?
    public let chance: Int?
    public let subtype: String?

    public init(
        type: String? = nil,
        rank: MHWRank? = nil,
        quantity: Int? = nil,
        chance: Int? = nil,
        subtype: String? = nil
    ) {
        self.type = type
        self.rank = rank
        self.quantity = quantity
        self.chance = chance
        self.subtype = subtype
    }
}

public enum JSONValue: Codable, Hashable, Sendable {
    case string(String)
    case number(Double)
    case bool(Bool)
    case object([String: JSONValue])
    case array([JSONValue])
    case null

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if container.decodeNil() {
            self = .null
        } else if let value = try? container.decode(Bool.self) {
            self = .bool(value)
        } else if let value = try? container.decode(Double.self) {
            self = .number(value)
        } else if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode([JSONValue].self) {
            self = .array(value)
        } else {
            self = .object(try container.decode([String: JSONValue].self))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .string(value):
            try container.encode(value)
        case let .number(value):
            try container.encode(value)
        case let .bool(value):
            try container.encode(value)
        case let .object(value):
            try container.encode(value)
        case let .array(value):
            try container.encode(value)
        case .null:
            try container.encodeNil()
        }
    }
}
