public struct MonsterHunterRequest: Sendable, Hashable {
    public var endpoint: MonsterHunterEndpoint
    public var query: String?
    public var projection: String?
    public var language: MonsterHunterLanguage

    public init(
        endpoint: MonsterHunterEndpoint,
        query: String? = nil,
        projection: String? = nil,
        language: MonsterHunterLanguage = .english
    ) {
        self.endpoint = endpoint
        self.query = query
        self.projection = projection
        self.language = language
    }
}
