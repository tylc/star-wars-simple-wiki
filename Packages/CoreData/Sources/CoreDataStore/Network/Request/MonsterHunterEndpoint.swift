import CoreModel

public enum MonsterHunterEndpoint: Sendable, Hashable {
    case ailments
    case ailment(id: MHWIdentifier)
    case armor
    case armorPiece(id: MHWIdentifier)
    case armorSets
    case armorSet(id: MHWIdentifier)
    case charms
    case charm(id: MHWIdentifier)
    case decorations
    case decoration(id: MHWIdentifier)
    case events
    case event(id: MHWIdentifier)
    case items
    case item(id: MHWIdentifier)
    case locations
    case location(id: MHWIdentifier)
    case monsters
    case monster(id: MHWIdentifier)
    case motionValues
    case motionValue(id: MHWIdentifier)
    case motionValuesByWeapon(type: String)
    case skills
    case skill(id: MHWIdentifier)
    case weapons
    case weapon(id: MHWIdentifier)

    var path: String {
        switch self {
        case .ailments: "ailments"
        case let .ailment(id): "ailments/\(id)"
        case .armor: "armor"
        case let .armorPiece(id): "armor/\(id)"
        case .armorSets: "armor/sets"
        case let .armorSet(id): "armor/sets/\(id)"
        case .charms: "charms"
        case let .charm(id): "charms/\(id)"
        case .decorations: "decorations"
        case let .decoration(id): "decorations/\(id)"
        case .events: "events"
        case let .event(id): "events/\(id)"
        case .items: "items"
        case let .item(id): "items/\(id)"
        case .locations: "locations"
        case let .location(id): "locations/\(id)"
        case .monsters: "monsters"
        case let .monster(id): "monsters/\(id)"
        case .motionValues: "motion-values"
        case let .motionValue(id): "motion-values/\(id)"
        case let .motionValuesByWeapon(type): "motion-values/\(type)"
        case .skills: "skills"
        case let .skill(id): "skills/\(id)"
        case .weapons: "weapons"
        case let .weapon(id): "weapons/\(id)"
        }
    }
}
