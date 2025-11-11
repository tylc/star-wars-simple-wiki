//
//  MonsterRewards.swift
//  CoreModel
//
//  Created by Enric Herce on 11/11/25.
//
import Foundation

struct MonsterReward: Codable, Equatable {
    #warning("struct item pending")
    public let item: String
    public let conditions: [RewardCondition]
}

struct RewardCondition: Codable, Equatable {
    public let kind: RewardConditionKind
    public let rank: Rank
    public let quantity: Int
    public let chance: Double
    public let part: Int?
}

enum Rank: String, Codable {
    case low
    case high
    case master
}

enum RewardConditionKind: String, Codable {
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
