import Foundation

public struct MonsterResistance: Codable, Equatable, Identifiable, Sendable {
    public let id: Int
    public let condition: String?
    public let kind: ResistanceKind

    public init(id: Int, condition: String? = nil, kind: ResistanceKind) {
        self.id = id
        self.condition = condition
        self.kind = kind
    }

    public enum ResistanceKind: Codable, Equatable, Sendable {
        case element(ElementResistance)
        case status(StatusResistance)
        case effect(EffectResistance)

        enum CodingKeys: String, CodingKey {
            case kind
        }

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
            case let .element(value):
                try container.encode(value)
            case let .status(value):
                try container.encode(value)
            case let .effect(value):
                try container.encode(value)
            }
        }
    }
}

public struct ElementResistance: Codable, Equatable, Sendable {
    public let element: String

    public init(element: String) {
        self.element = element
    }
}

public struct StatusResistance: Codable, Equatable, Sendable {
    public let status: String

    public init(status: String) {
        self.status = status
    }
}

public struct EffectResistance: Codable, Equatable, Sendable {
    public let effect: String

    public init(effect: String) {
        self.effect = effect
    }
}
