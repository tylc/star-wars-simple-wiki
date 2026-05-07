import Foundation

public struct GameLocation: Codable, Equatable, Sendable {
    public let regionName: String
    public let areaName: String?
    public let notes: String?

    public init(regionName: String, areaName: String? = nil, notes: String? = nil) {
        self.regionName = regionName
        self.areaName = areaName
        self.notes = notes
    }
}
