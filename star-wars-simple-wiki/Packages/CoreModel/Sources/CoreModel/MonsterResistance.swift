//
//  MonsterResistance.swift
//  CoreModel
//
//  Created by Enric Herce on 11/11/25.
//

import Foundation

#warning("creeate a generic resistance/weakness and use it")
public struct MonsterResistance: Codable, Equatable, Identifiable {
    public let id: Int
    public let condition: String?
    public let kind: ResistanceKind
    
    public enum ResistanceKind: Codable, Equatable {
        case element(ElementResistance)
        case status(StatusResistance)
        case effect(EffectResistance)
        
        enum CodingKeys: String, CodingKey { case kind }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let kindString = try container.decode(String.self, forKey: .kind)
            let singleContainer = try decoder.singleValueContainer()
            
            switch kindString {
            case "element":
                self = .element(try singleContainer.decode(ElementResistance.self))
            case "status":
                self = .status(try singleContainer.decode(StatusResistance.self))
            case "effect":
                self = .effect(try singleContainer.decode(EffectResistance.self))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: .kind,
                    in: container,
                    debugDescription: "Unknown ResistanceKind: \(kindString)"
                )
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

public struct ElementResistance: Codable, Equatable { public let element: String }

public struct StatusResistance: Codable, Equatable { public let status: String }

public struct EffectResistance: Codable, Equatable { public let effect: String }
