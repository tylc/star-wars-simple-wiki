import CoreDataStore
import CoreDomain
import Swinject

final class MonsterHunterAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MonsterHunterClientProtocol.self) { _ in
            MonsterHunterAPIClient()
        }
        .inObjectScope(.container)

        container.register(MonsterHunterRepositoryProtocol.self) { resolver in
            MonsterHunterRepository(
                client: resolver.resolve(MonsterHunterClientProtocol.self)!
            )
        }
        .inObjectScope(.container)

        container.register(FetchMonstersUseCaseProtocol.self) { resolver in
            FetchMonstersUseCase(
                repository: resolver.resolve(MonsterHunterRepositoryProtocol.self)!
            )
        }
    }
}
