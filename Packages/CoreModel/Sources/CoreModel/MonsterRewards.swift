import Foundation

public struct MonsterReward: Codable, Equatable, Sendable {
    public let item: String
    public let conditions: [RewardCondition]

    public init(item: String, conditions: [RewardCondition]) {
        self.item = item
        self.conditions = conditions
    }
}

public struct RewardCondition: Codable, Equatable, Sendable {
    public let kind: RewardConditionKind
    public let rank: Rank
    public let quantity: Int
    public let chance: Double
    public let part: Int?

    public init(kind: RewardConditionKind, rank: Rank, quantity: Int, chance: Double, part: Int? = nil) {
        self.kind = kind
        self.rank = rank
        self.quantity = quantity
        self.chance = chance
        self.part = part
    }
}

public enum Rank: String, Codable, Sendable {
    case low
    case high
    case master
}

public enum RewardConditionKind: String, Codable, Sendable {
    case carve
    case carveSevered = "carve-severed"
    case endemicCapture = "endemic-capture"
    case targetReward = "target-reward"
    case brokenPart = "broken-part"
    case woundDestroyed = "wound-destroyed"
    case carveRotten = "carve-rotten"
    case slingerGather = "slinger-gather"
    case carveRottenSevered = "carve-rotten-severed"
    case temperedWoundDestroyed = "tempered-wound-destroyed"
    case carveCrystallized = "carve-crystallized"
}
