import Foundation

public struct MonsterPart: Codable, Equatable, Identifiable, Sendable {
    public let id: Int
    public let kind: String
    public let health: Int
    public let multipliers: [String: Float]

    public init(id: Int, kind: String, health: Int, multipliers: [String: Float]) {
        self.id = id
        self.kind = kind
        self.health = health
        self.multipliers = multipliers
    }
}
