import Alamofire

public protocol MonsterHunterClientProtocol: Sendable {
    func fetch<Value: Decodable & Sendable>(_ request: MonsterHunterRequest) async throws -> Value
}

public final class MonsterHunterAPIClient: BaseHTTPClient, MonsterHunterClientProtocol, @unchecked Sendable {
    public func fetch<Value: Decodable & Sendable>(_ request: MonsterHunterRequest) async throws -> Value {
        try await perform(request: MonsterHunterURLRequest(request: request))
    }
}
