@testable import CoreDomain

func coreDomainFixtureTypesCompile(repository: any MonsterHunterRepositoryProtocol) {
    _ = FetchMonstersUseCase(repository: repository)
}
