//
//  MonsterDTO.swift
//  CoreData
//
//  Created by Enric Herce on 13/1/26.
//

import Foundation

public struct MonsterDTO: Codable, Sendable {
    public let id: Int
    public let name: String
    public let type: String
    public let species: String
    public let description: String
    public let elements: [String]
    public let ailments: [String]
    public let locations: [String]
    public let resistances: [String]
    public let weaknesses: [WeaknessDTO]
    public let rewards: [RewardDTO]
    
    public init(
        id: Int,
        name: String,
        type: String,
        species: String,
        description: String,
        elements: [String],
        ailments: [String],
        locations: [String],
        resistances: [String],
        weaknesses: [WeaknessDTO],
        rewards: [RewardDTO]
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
}

public struct WeaknessDTO: Codable, Sendable {
    public let element: String
    public let stars: Int
    public let condition: String?
}

public struct RewardDTO: Codable, Sendable {
    public let id: Int
    public let item: ItemDTO
    public let conditions: [RewardConditionDTO]
}

public struct ItemDTO: Codable, Sendable {
    public let id: Int
    public let name: String
    public let description: String
    public let rarity: Int
    public let carryLimit: Int
    public let value: Int
}

public struct RewardConditionDTO: Codable, Sendable {
    public let type: String
    public let subtype: String?
    public let rank: String
    public let quantity: Int
    public let chance: Int
}
