import CoreModel

public struct MotionValueDTO: Codable, Sendable, Identifiable {
    public let id: MHWIdentifier
    public let name: String
    public let weaponType: String?
    public let damageType: String?
    public let stun: Int?
    public let exhaust: Int?
    public let hits: [HitDTO]?

    public struct HitDTO: Codable, Sendable {
        public let damage: Int?
    }

    func toModel() throws -> MHWMotionValue {
        try DTOMapper.map(self, to: MHWMotionValue.self)
    }
}
