import CoreModel

public struct AilmentDTO: Codable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let description: String?
    public let recovery: RecoveryDTO?
    public let protection: ProtectionDTO?

    public struct RecoveryDTO: Codable, Sendable {
        public let actions: [String]?
        public let items: [ItemDTO]?
    }

    public struct ProtectionDTO: Codable, Sendable {
        public let items: [ItemDTO]?
        public let skills: [NamedDTO]?
    }

    func toModel() throws -> MHWAilment {
        try DTOMapper.map(self, to: MHWAilment.self)
    }
}
