import CoreModel

public protocol MonsterHunterRepositoryProtocol: Sendable {
    func fetchAilments(query: String?, projection: String?) async throws -> [MHWAilment]
    func fetchAilment(id: MHWIdentifier, projection: String?) async throws -> MHWAilment
    func fetchArmor(query: String?, projection: String?) async throws -> [MHWArmor]
    func fetchArmorPiece(id: MHWIdentifier, projection: String?) async throws -> MHWArmor
    func fetchArmorSets(query: String?, projection: String?) async throws -> [MHWArmorSet]
    func fetchArmorSet(id: MHWIdentifier, projection: String?) async throws -> MHWArmorSet
    func fetchCharms(query: String?, projection: String?) async throws -> [MHWCharm]
    func fetchCharm(id: MHWIdentifier, projection: String?) async throws -> MHWCharm
    func fetchDecorations(query: String?, projection: String?) async throws -> [MHWDecoration]
    func fetchDecoration(id: MHWIdentifier, projection: String?) async throws -> MHWDecoration
    func fetchEvents(query: String?, projection: String?) async throws -> [MHWEvent]
    func fetchEvent(id: MHWIdentifier, projection: String?) async throws -> MHWEvent
    func fetchItems(query: String?, projection: String?) async throws -> [MHWItem]
    func fetchItem(id: MHWIdentifier, projection: String?) async throws -> MHWItem
    func fetchLocations(query: String?, projection: String?) async throws -> [MHWLocation]
    func fetchLocation(id: MHWIdentifier, projection: String?) async throws -> MHWLocation
    func fetchMonsters(query: String?, projection: String?) async throws -> [MHWMonster]
    func fetchMonster(id: MHWIdentifier, projection: String?) async throws -> MHWMonster
    func fetchMotionValues(query: String?, projection: String?) async throws -> [MHWMotionValue]
    func fetchMotionValue(id: MHWIdentifier, projection: String?) async throws -> MHWMotionValue
    func fetchMotionValues(weaponType: String, query: String?, projection: String?) async throws -> [MHWMotionValue]
    func fetchSkills(query: String?, projection: String?) async throws -> [MHWSkill]
    func fetchSkill(id: MHWIdentifier, projection: String?) async throws -> MHWSkill
    func fetchWeapons(query: String?, projection: String?) async throws -> [MHWWeapon]
    func fetchWeapon(id: MHWIdentifier, projection: String?) async throws -> MHWWeapon
}
