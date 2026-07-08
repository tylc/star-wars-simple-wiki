public struct MonsterHunterUseCases: Sendable {
    public let fetchAilments: any FetchAilmentsUseCaseProtocol
    public let fetchAilment: any FetchAilmentUseCaseProtocol
    public let fetchArmor: any FetchArmorUseCaseProtocol
    public let fetchArmorPiece: any FetchArmorPieceUseCaseProtocol
    public let fetchArmorSets: any FetchArmorSetsUseCaseProtocol
    public let fetchArmorSet: any FetchArmorSetUseCaseProtocol
    public let fetchCharms: any FetchCharmsUseCaseProtocol
    public let fetchCharm: any FetchCharmUseCaseProtocol
    public let fetchDecorations: any FetchDecorationsUseCaseProtocol
    public let fetchDecoration: any FetchDecorationUseCaseProtocol
    public let fetchEvents: any FetchEventsUseCaseProtocol
    public let fetchEvent: any FetchEventUseCaseProtocol
    public let fetchItems: any FetchItemsUseCaseProtocol
    public let fetchItem: any FetchItemUseCaseProtocol
    public let fetchLocations: any FetchLocationsUseCaseProtocol
    public let fetchLocation: any FetchLocationUseCaseProtocol
    public let fetchMonsters: any FetchMonstersUseCaseProtocol
    public let fetchMonster: any FetchMonsterUseCaseProtocol
    public let fetchMotionValues: any FetchMotionValuesUseCaseProtocol
    public let fetchMotionValue: any FetchMotionValueUseCaseProtocol
    public let fetchSkills: any FetchSkillsUseCaseProtocol
    public let fetchSkill: any FetchSkillUseCaseProtocol
    public let fetchWeapons: any FetchWeaponsUseCaseProtocol
    public let fetchWeapon: any FetchWeaponUseCaseProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.fetchAilments = FetchAilmentsUseCase(repository: repository)
        self.fetchAilment = FetchAilmentUseCase(repository: repository)
        self.fetchArmor = FetchArmorUseCase(repository: repository)
        self.fetchArmorPiece = FetchArmorPieceUseCase(repository: repository)
        self.fetchArmorSets = FetchArmorSetsUseCase(repository: repository)
        self.fetchArmorSet = FetchArmorSetUseCase(repository: repository)
        self.fetchCharms = FetchCharmsUseCase(repository: repository)
        self.fetchCharm = FetchCharmUseCase(repository: repository)
        self.fetchDecorations = FetchDecorationsUseCase(repository: repository)
        self.fetchDecoration = FetchDecorationUseCase(repository: repository)
        self.fetchEvents = FetchEventsUseCase(repository: repository)
        self.fetchEvent = FetchEventUseCase(repository: repository)
        self.fetchItems = FetchItemsUseCase(repository: repository)
        self.fetchItem = FetchItemUseCase(repository: repository)
        self.fetchLocations = FetchLocationsUseCase(repository: repository)
        self.fetchLocation = FetchLocationUseCase(repository: repository)
        self.fetchMonsters = FetchMonstersUseCase(repository: repository)
        self.fetchMonster = FetchMonsterUseCase(repository: repository)
        self.fetchMotionValues = FetchMotionValuesUseCase(repository: repository)
        self.fetchMotionValue = FetchMotionValueUseCase(repository: repository)
        self.fetchSkills = FetchSkillsUseCase(repository: repository)
        self.fetchSkill = FetchSkillUseCase(repository: repository)
        self.fetchWeapons = FetchWeaponsUseCase(repository: repository)
        self.fetchWeapon = FetchWeaponUseCase(repository: repository)
    }
}
