import CoreModel

public struct LocationDTO: Codable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let zoneCount: Int?
    public let camps: [CampDTO]?

    public struct CampDTO: Codable, Sendable {
        public let id: MHWIdentifier?
        public let name: String?
        public let zone: Int?
    }

    func toModel() throws -> MHWLocation {
        try DTOMapper.map(self, to: MHWLocation.self)
    }
}
