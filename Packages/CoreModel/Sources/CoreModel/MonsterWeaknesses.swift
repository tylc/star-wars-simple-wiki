import Foundation

public struct MonsterWeakness: Codable, Equatable, Identifiable, Sendable {
    public let id: Int
    public let level: Int
    public let condition: String?
    public let kind: WeaknessKindUnion

    public init(id: Int, level: Int, condition: String? = nil, kind: WeaknessKindUnion) {
        self.id = id
        self.level = level
        self.condition = condition
        self.kind = kind
    }

    public enum WeaknessKindUnion: Codable, Equatable, Sendable {
        case element(ElementWeakness)
        case status(StatusWeakness)
        case effect(EffectWeakness)

        enum CodingKeys: String, CodingKey {
            case kind
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let kindString = try container.decode(String.self, forKey: .kind)
            let singleContainer = try decoder.singleValueContainer()

            switch kindString {
            case "element":
                self = .element(try singleContainer.decode(ElementWeakness.self))
            case "status":
                self = .status(try singleContainer.decode(StatusWeakness.self))
            case "effect":
                self = .effect(try singleContainer.decode(EffectWeakness.self))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: .kind,
                    in: container,
                    debugDescription: "Unknown WeaknessKind: \(kindString)"
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

public struct ElementWeakness: Codable, Equatable, Sendable {
    public let element: String

    public init(element: String) {
        self.element = element
    }
}

public struct StatusWeakness: Codable, Equatable, Sendable {
    public let status: String

    public init(status: String) {
        self.status = status
    }
}

public struct EffectWeakness: Codable, Equatable, Sendable {
    public let effect: String

    public init(effect: String) {
        self.effect = effect
    }
}
