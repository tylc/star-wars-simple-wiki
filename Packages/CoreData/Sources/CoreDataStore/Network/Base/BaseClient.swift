import Alamofire
import Foundation

open class BaseClient: @unchecked Sendable {
    private let session: Session
    private let decoder: DataDecoder

    public init(
        session: Session = .default,
        decoder: DataDecoder = JSONDecoder()
    ) {
        self.session = session
        self.decoder = decoder
    }

    public func perform<Value: Decodable & Sendable>(
        route: any BaseRouter,
        as type: Value.Type
    ) async throws -> Value {
        try await session.request(route)
            .validate(statusCode: 200..<300)
            .serializingDecodable(Value.self, decoder: decoder)
            .value
    }
}
