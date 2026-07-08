import Foundation
import CoreModel

public struct MonsterDTO: Codable, Sendable {
    public let id: Int
    public let name: String
    public let type: String?
    public let species: String?
    public let description: String?
    public let elements: [String]?
    public let ailments: [NamedDTO]?
    public let locations: [NamedDTO]?
    public let resistances: [ResistanceDTO]?
    public let weaknesses: [WeaknessDTO]?
    public let rewards: [RewardDTO]?

    public init(
        id: Int,
        name: String,
        type: String? = nil,
        species: String? = nil,
        description: String? = nil,
        elements: [String]? = nil,
        ailments: [NamedDTO]? = nil,
        locations: [NamedDTO]? = nil,
        resistances: [ResistanceDTO]? = nil,
        weaknesses: [WeaknessDTO]? = nil,
        rewards: [RewardDTO]? = nil
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

    public func toMHWMonster() -> MHWMonster {
        MHWMonster(
            id: id,
            name: name,
            type: type,
            species: species,
            description: description,
            elements: elements,
            ailments: ailments?.map { MHWNamedResource(id: $0.id, name: $0.name, description: $0.description) },
            locations: locations?.map { MHWNamedResource(id: $0.id, name: $0.name, description: $0.description) },
            resistances: resistances?.map { $0.toModel() },
            weaknesses: weaknesses?.map { $0.toModel() },
            rewards: rewards?.map { $0.toModel() }
        )
    }
}

public struct NamedDTO: Codable, Sendable {
    public let id: Int
    public let name: String
    public let description: String?
}

public struct ResistanceDTO: Codable, Sendable {
    public let element: MHWElement?
    public let condition: String?

    func toModel() -> MHWMonster.Resistance {
        MHWMonster.Resistance(element: element, condition: condition)
    }
}

public struct WeaknessDTO: Codable, Sendable {
    public let element: MHWElement?
    public let stars: Int?
    public let condition: String?

    func toModel() -> MHWMonster.Weakness {
        MHWMonster.Weakness(element: element, stars: stars, condition: condition)
    }
}

public struct RewardDTO: Codable, Sendable {
    public let id: Int?
    public let item: MonsterItemDTO?
    public let conditions: [RewardConditionDTO]?

    func toModel() -> MHWMonster.Reward {
        MHWMonster.Reward(
            id: id,
            item: item?.toModel(),
            conditions: conditions?.map { $0.toModel() }
        )
    }
}

public struct MonsterItemDTO: Codable, Sendable {
    public let id: Int
    public let name: String
    public let description: String?
    public let rarity: Int?
    public let carryLimit: Int?
    public let value: Int?
    public let sellPrice: Int?
    public let buyPrice: Int?

    func toModel() -> MHWItem {
        MHWItem(
            id: id,
            name: name,
            description: description,
            rarity: rarity,
            carryLimit: carryLimit,
            value: value,
            sellPrice: sellPrice,
            buyPrice: buyPrice
        )
    }
}

public struct RewardConditionDTO: Codable, Sendable {
    public let type: String?
    public let subtype: String?
    public let rank: MHWRank?
    public let quantity: Int?
    public let chance: Int?

    func toModel() -> MHWRewardCondition {
        MHWRewardCondition(
            type: type,
            rank: rank,
            quantity: quantity,
            chance: chance,
            subtype: subtype
        )
    }
}
