import CoreModel

public protocol MonsterHunterRepositoryProtocol: Sendable {
    func fetchAilments(query: String?) async throws -> [MHWAilment]
    func fetchAilment(id: MHWIdentifier) async throws -> MHWAilment
    func fetchArmor(query: String?) async throws -> [MHWArmor]
    func fetchArmorPiece(id: MHWIdentifier) async throws -> MHWArmor
    func fetchArmorSets(query: String?) async throws -> [MHWArmorSet]
    func fetchArmorSet(id: MHWIdentifier) async throws -> MHWArmorSet
    func fetchCharms(query: String?) async throws -> [MHWCharm]
    func fetchCharm(id: MHWIdentifier) async throws -> MHWCharm
    func fetchDecorations(query: String?) async throws -> [MHWDecoration]
    func fetchDecoration(id: MHWIdentifier) async throws -> MHWDecoration
    func fetchEvents(query: String?) async throws -> [MHWEvent]
    func fetchEvent(id: MHWIdentifier) async throws -> MHWEvent
    func fetchItems(query: String?) async throws -> [MHWItem]
    func fetchItem(id: MHWIdentifier) async throws -> MHWItem
    func fetchLocations(query: String?) async throws -> [MHWLocation]
    func fetchLocation(id: MHWIdentifier) async throws -> MHWLocation
    func fetchMonsters(query: String?) async throws -> [MHWMonster]
    func fetchMonster(id: MHWIdentifier) async throws -> MHWMonster
    func fetchMotionValues(query: String?) async throws -> [MHWMotionValue]
    func fetchMotionValue(id: MHWIdentifier) async throws -> MHWMotionValue
    func fetchMotionValues(weaponType: String, query: String?) async throws -> [MHWMotionValue]
    func fetchSkills(query: String?) async throws -> [MHWSkill]
    func fetchSkill(id: MHWIdentifier) async throws -> MHWSkill
    func fetchWeapons(query: String?) async throws -> [MHWWeapon]
    func fetchWeapon(id: MHWIdentifier) async throws -> MHWWeapon
}
