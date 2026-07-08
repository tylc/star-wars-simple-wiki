import Alamofire

public protocol MonsterHunterAPIClientProtocol: Sendable {
    func fetch<Value: Decodable & Sendable>(_ request: MonsterHunterRequest, as type: Value.Type) async throws -> Value
}

public final class MonsterHunterAPIClient: BaseHTTPClient, MonsterHunterAPIClientProtocol, @unchecked Sendable {
    public func fetch<Value: Decodable & Sendable>(_ request: MonsterHunterRequest, as type: Value.Type) async throws -> Value {
        try await perform(request: MonsterHunterAPIRequest(request: request), as: type)
    }
}
