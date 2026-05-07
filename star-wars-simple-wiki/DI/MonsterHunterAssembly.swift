import CoreDataStore
import CoreDomain
import Swinject

final class MonsterHunterAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MonsterHunterAPIClientProtocol.self) { _ in
            MonsterHunterAPIClient()
        }
        .inObjectScope(.container)

        container.register(MonsterHunterRepositoryProtocol.self) { resolver in
            MonsterHunterRepository(
                client: resolver.resolve(MonsterHunterAPIClientProtocol.self)!
            )
        }
        .inObjectScope(.container)

        container.register(FetchAilmentsUseCaseProtocol.self) { resolver in
            FetchAilmentsUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchAilmentUseCaseProtocol.self) { resolver in
            FetchAilmentUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchArmorUseCaseProtocol.self) { resolver in
            FetchArmorUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchArmorPieceUseCaseProtocol.self) { resolver in
            FetchArmorPieceUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchArmorSetsUseCaseProtocol.self) { resolver in
            FetchArmorSetsUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchArmorSetUseCaseProtocol.self) { resolver in
            FetchArmorSetUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchCharmsUseCaseProtocol.self) { resolver in
            FetchCharmsUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchCharmUseCaseProtocol.self) { resolver in
            FetchCharmUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchDecorationsUseCaseProtocol.self) { resolver in
            FetchDecorationsUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchDecorationUseCaseProtocol.self) { resolver in
            FetchDecorationUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchEventsUseCaseProtocol.self) { resolver in
            FetchEventsUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchEventUseCaseProtocol.self) { resolver in
            FetchEventUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchItemsUseCaseProtocol.self) { resolver in
            FetchItemsUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchItemUseCaseProtocol.self) { resolver in
            FetchItemUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchLocationsUseCaseProtocol.self) { resolver in
            FetchLocationsUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchLocationUseCaseProtocol.self) { resolver in
            FetchLocationUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchMonstersUseCaseProtocol.self) { resolver in
            FetchMonstersUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchMonsterUseCaseProtocol.self) { resolver in
            FetchMonsterUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchMotionValuesUseCaseProtocol.self) { resolver in
            FetchMotionValuesUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchMotionValueUseCaseProtocol.self) { resolver in
            FetchMotionValueUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchSkillsUseCaseProtocol.self) { resolver in
            FetchSkillsUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchSkillUseCaseProtocol.self) { resolver in
            FetchSkillUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchWeaponsUseCaseProtocol.self) { resolver in
            FetchWeaponsUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(FetchWeaponUseCaseProtocol.self) { resolver in
            FetchWeaponUseCase(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }

        container.register(MonsterHunterUseCases.self) { resolver in
            MonsterHunterUseCases(repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!)
        }
    }
}
