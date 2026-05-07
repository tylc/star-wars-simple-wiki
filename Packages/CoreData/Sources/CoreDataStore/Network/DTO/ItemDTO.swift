import CoreModel

public struct ItemDTO: Codable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let description: String?
    public let rarity: Int?
    public let carryLimit: Int?
    public let value: Int?
    public let sellPrice: Int?
    public let buyPrice: Int?

    func toModel() throws -> MHWItem {
        try DTOMapper.map(self, to: MHWItem.self)
    }
}
