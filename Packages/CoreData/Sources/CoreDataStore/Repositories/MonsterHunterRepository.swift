import CoreDomain
import CoreModel

public struct MonsterHunterRepository: MonsterHunterRepositoryProtocol {
    private let client: any MonsterHunterClientProtocol
    private let language: MonsterHunterLanguage

    public init(
        client: any MonsterHunterClientProtocol = MonsterHunterAPIClient(),
        language: MonsterHunterLanguage = .english
    ) {
        self.client = client
        self.language = language
    }

    public func fetchAilments(query: String? = nil) async throws -> [MHWAilment] {
        let dto: [AilmentDTO] = try await list(.ailments, query: query)
        return try dto.map { try $0.toModel() }
    }

    public func fetchAilment(id: MHWIdentifier) async throws -> MHWAilment {
        let dto: AilmentDTO = try await detail(.ailment(id: id))
        return try dto.toModel()
    }

    public func fetchArmor(query: String? = nil) async throws -> [MHWArmor] {
        let dto: [ArmorDTO] = try await list(.armor, query: query)
        return try dto.map { try $0.toModel() }
    }

    public func fetchArmorPiece(id: MHWIdentifier) async throws -> MHWArmor {
        let dto: ArmorDTO = try await detail(.armorPiece(id: id))
        return try dto.toModel()
    }

    public func fetchArmorSets(query: String? = nil) async throws -> [MHWArmorSet] {
        let dto: [ArmorSetDTO] = try await list(.armorSets, query: query)
        return try dto.map { try $0.toModel() }
    }

    public func fetchArmorSet(id: MHWIdentifier) async throws -> MHWArmorSet {
        let dto: ArmorSetDTO = try await detail(.armorSet(id: id))
        return try dto.toModel()
    }

    public func fetchCharms(query: String? = nil) async throws -> [MHWCharm] {
        let dto: [CharmDTO] = try await list(.charms, query: query)
        return try dto.map { try $0.toModel() }
    }

    public func fetchCharm(id: MHWIdentifier) async throws -> MHWCharm {
        let dto: CharmDTO = try await detail(.charm(id: id))
        return try dto.toModel()
    }

    public func fetchDecorations(query: String? = nil) async throws -> [MHWDecoration] {
        let dto: [DecorationDTO] = try await list(.decorations, query: query)
        return try dto.map { try $0.toModel() }
    }

    public func fetchDecoration(id: MHWIdentifier) async throws -> MHWDecoration {
        let dto: DecorationDTO = try await detail(.decoration(id: id))
        return try dto.toModel()
    }

    public func fetchEvents(query: String? = nil) async throws -> [MHWEvent] {
        let dto: [EventDTO] = try await list(.events, query: query)
        return try dto.map { try $0.toModel() }
    }

    public func fetchEvent(id: MHWIdentifier) async throws -> MHWEvent {
        let dto: EventDTO = try await detail(.event(id: id))
        return try dto.toModel()
    }

    public func fetchItems(query: String? = nil) async throws -> [MHWItem] {
        let dto: [ItemDTO] = try await list(.items, query: query)
        return try dto.map { try $0.toModel() }
    }

    public func fetchItem(id: MHWIdentifier) async throws -> MHWItem {
        let dto: ItemDTO = try await detail(.item(id: id))
        return try dto.toModel()
    }

    public func fetchLocations(query: String? = nil) async throws -> [MHWLocation] {
        let dto: [LocationDTO] = try await list(.locations, query: query)
        return try dto.map { try $0.toModel() }
    }

    public func fetchLocation(id: MHWIdentifier) async throws -> MHWLocation {
        let dto: LocationDTO = try await detail(.location(id: id))
        return try dto.toModel()
    }

    public func fetchMonsters(query: String? = nil) async throws -> [MHWMonster] {
        let dto: [MonsterDTO] = try await list(.monsters, query: query)
        return dto.map { $0.toMHWMonster() }
    }

    public func fetchMonster(id: MHWIdentifier) async throws -> MHWMonster {
        let dto: MonsterDTO = try await detail(.monster(id: id))
        return dto.toMHWMonster()
    }

    public func fetchMotionValues(query: String? = nil) async throws -> [MHWMotionValue] {
        let dto: [MotionValueDTO] = try await list(.motionValues, query: query)
        return try dto.map { try $0.toModel() }
    }

    public func fetchMotionValue(id: MHWIdentifier) async throws -> MHWMotionValue {
        let dto: MotionValueDTO = try await detail(.motionValue(id: id))
        return try dto.toModel()
    }

    public func fetchMotionValues(weaponType: String, query: String? = nil) async throws -> [MHWMotionValue] {
        let dto: [MotionValueDTO] = try await list(.motionValuesByWeapon(type: weaponType), query: query)
        return try dto.map { try $0.toModel() }
    }

    public func fetchSkills(query: String? = nil) async throws -> [MHWSkill] {
        let dto: [SkillDTO] = try await list(.skills, query: query)
        return try dto.map { try $0.toModel() }
    }

    public func fetchSkill(id: MHWIdentifier) async throws -> MHWSkill {
        let dto: SkillDTO = try await detail(.skill(id: id))
        return try dto.toModel()
    }

    public func fetchWeapons(query: String? = nil) async throws -> [MHWWeapon] {
        let dto: [WeaponDTO] = try await list(.weapons, query: query)
        return try dto.map { try $0.toModel() }
    }

    public func fetchWeapon(id: MHWIdentifier) async throws -> MHWWeapon {
        let dto: WeaponDTO = try await detail(.weapon(id: id))
        return try dto.toModel()
    }

    private func list<Value: Decodable & Sendable>(
        _ endpoint: MonsterHunterEndpoint,
        query: String?
    ) async throws -> [Value] {
        try await client.fetch(
            MonsterHunterRequest(endpoint: endpoint, query: query, language: language)
        )
    }

    private func detail<Value: Decodable & Sendable>(
        _ endpoint: MonsterHunterEndpoint
    ) async throws -> Value {
        try await client.fetch(
            MonsterHunterRequest(endpoint: endpoint, language: language)
        )
    }
}
