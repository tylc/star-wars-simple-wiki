import Alamofire
import Foundation

open class BaseHTTPClient: @unchecked Sendable {
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
        request: any APIRequest
    ) async throws -> Value {
        try await session.request(request)
            .validate(statusCode: 200..<300)
            .serializingDecodable(Value.self, decoder: decoder)
            .value
    }
}
