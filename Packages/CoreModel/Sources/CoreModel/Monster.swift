import Foundation

public struct Monster: Codable, Identifiable, Equatable, Sendable {
    public let id: Int
    public let gameId: Int
    public let kind: MonsterKind
    public let species: Species
    public let name: String
    public let size: MonsterSize
    public let description: String
    public let features: String?
    public let tips: String?
    public let baseHealth: Int
    public let locations: [GameLocation]
    public let resistances: [MonsterResistance]
    public let weaknesses: [MonsterWeakness]
    public let rewards: [MonsterReward]
    public let parts: [MonsterPart]

    public init(
        id: Int,
        gameId: Int,
        kind: MonsterKind,
        species: Species,
        name: String,
        size: MonsterSize,
        description: String,
        features: String? = nil,
        tips: String? = nil,
        baseHealth: Int,
        locations: [GameLocation],
        resistances: [MonsterResistance],
        weaknesses: [MonsterWeakness],
        rewards: [MonsterReward],
        parts: [MonsterPart]
    ) {
        self.id = id
        self.gameId = gameId
        self.kind = kind
        self.species = species
        self.name = name
        self.size = size
        self.description = description
        self.features = features
        self.tips = tips
        self.baseHealth = baseHealth
        self.locations = locations
        self.resistances = resistances
        self.weaknesses = weaknesses
        self.rewards = rewards
        self.parts = parts
    }
}

public enum MonsterKind: String, Codable, Sendable {
    case large
    case small
}

public enum Species: String, Codable, CaseIterable, Sendable {
    case flyingWyvern = "flying-wyvern"
    case fish
    case herbivore
    case lynian
    case neopteron
    case carapaceon
    case fangedBeast = "fanged-beast"
    case birdWyvern = "bird-wyvern"
    case piscineWyvern = "piscine-wyvern"
    case leviathan
    case bruteWyvern = "brute-wyvern"
    case fangedWyvern = "fanged-wyvern"
    case amphibian
    case temnoceran
    case snakeWyvern = "snake-wyvern"
    case elderDragon = "elder-dragon"
    case cephalopod
    case construct
    case wingdrake
    case demiElder = "demi-elder"
}
