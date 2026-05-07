import CoreModel

public protocol FetchEventsUseCaseProtocol: Sendable {
    func execute(query: String?, projection: String?) async throws -> [MHWEvent]
}

public final class FetchEventsUseCase: FetchEventsUseCaseProtocol, @unchecked Sendable {
    private let repository: any MonsterHunterRepositoryProtocol

    public init(repository: any MonsterHunterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(query: String? = nil, projection: String? = nil) async throws -> [MHWEvent] {
        try await repository.fetchEvents(query: query, projection: projection)
    }
}
