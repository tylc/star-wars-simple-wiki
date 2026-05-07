import CoreModel

public struct CharmDTO: Codable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let ranks: [CharmRankDTO]?

    func toModel() throws -> MHWCharm {
        try DTOMapper.map(self, to: MHWCharm.self)
    }
}
