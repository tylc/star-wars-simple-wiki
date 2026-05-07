import CoreModel

public struct EventDTO: Codable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let platform: String?
    public let exclusive: Bool?
    public let type: String?
    public let expansion: String?
    public let description: String?
    public let requirements: String?
    public let questRank: Int?
    public let startTimestamp: String?
    public let endTimestamp: String?

    func toModel() throws -> MHWEvent {
        try DTOMapper.map(self, to: MHWEvent.self)
    }
}
