import Swinject

enum AppContainer {
    static let shared: Container = {
        let container = Container()
        Assembler(
            [
                MonsterHunterAssembly()
            ],
            container: container
        )
        return container
    }()
}
