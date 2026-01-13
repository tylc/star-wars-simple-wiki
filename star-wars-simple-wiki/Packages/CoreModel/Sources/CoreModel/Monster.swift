//
//  Monster.swift
//  CoreModel
//
//  Created by Enric Herce on 11/11/25.
//
import Foundation

public struct Monster: Codable, Identifiable, Equatable {
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
}

// MARK: - Enums for categories
public enum MonsterKind: String, Codable {
    case large
    case small
}

public enum Species: String, Codable, CaseIterable {
    case flyingWyvern = "flying-wyvern"
    case fish = "fish"
    case herbivore = "herbivore"
    case lynian = "lynian"
    case neopteron = "neopteron"
    case carapaceon = "carapaceon"
    case fangedBeast = "fanged-beast"
    case birdWyvern = "bird-wyvern"
    case piscineWyvern = "piscine-wyvern"
    case leviathan = "leviathan"
    case bruteWyvern = "brute-wyvern"
    case fangedWyvern = "fanged-wyvern"
    case amphibian = "amphibian"
    case temnoceran = "temnoceran"
    case snakeWyvern = "snake-wyvern"
    case elderDragon = "elder-dragon"
    case cephalopod = "cephalopod"
    case construct = "construct"
    case wingdrake = "wingdrake"
    case demiElder = "demi-elder"
}
