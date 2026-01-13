//
//  MonsterWeaknesses.swift
//  CoreModel
//
//  Created by Enric Herce on 11/11/25.
//

import Foundation

public struct MonsterWeakness: Codable, Equatable, Identifiable {
    public let id: Int
    public let level: Int
    public let condition: String?
    public let kind: WeaknessKindUnion

    public enum WeaknessKindUnion: Codable, Equatable {
        case element(ElementWeakness)
        case status(StatusWeakness)
        case effect(EffectWeakness)

        enum CodingKeys: String, CodingKey { case kind }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let kindString = try container.decode(String.self, forKey: .kind)
            let singleContainer = try decoder.singleValueContainer()

            switch kindString {
            case "element": self = .element(try singleContainer.decode(ElementWeakness.self))
            case "status": self = .status(try singleContainer.decode(StatusWeakness.self))
            case "effect": self = .effect(try singleContainer.decode(EffectWeakness.self))
            default:
                throw DecodingError.dataCorruptedError(forKey: .kind,
                                                       in: container,
                                                       debugDescription: "Unknown WeaknessKind: \(kindString)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .element(let val): try container.encode(val)
            case .status(let val): try container.encode(val)
            case .effect(let val): try container.encode(val)
            }
        }
    }
}

public struct ElementWeakness: Codable, Equatable { public let element: String }
public struct StatusWeakness: Codable, Equatable { public let status: String }
public struct EffectWeakness: Codable, Equatable { public let effect: String }

