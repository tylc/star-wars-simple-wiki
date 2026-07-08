import Foundation

public struct MonsterSize: Codable, Equatable, Sendable {
    public let base: Float
    public let mini: Float
    public let silver: Float
    public let gold: Float

    public init(base: Float, mini: Float, silver: Float, gold: Float) {
        self.base = base
        self.mini = mini
        self.silver = silver
        self.gold = gold
    }
}
