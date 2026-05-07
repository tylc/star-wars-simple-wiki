import Alamofire
import Foundation

public enum ParameterEncodingType: Sendable {
    case url
    case body
}

public protocol BaseRouter: URLRequestConvertible, Sendable {
    var method: HTTPMethod { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var headers: HTTPHeaders { get }
    var body: (any Encodable & Sendable)? { get }
    var baseURL: URL { get }
    var parameterEncoding: ParameterEncodingType { get }
}

public extension BaseRouter {
    var method: HTTPMethod { .get }
    var queryItems: [URLQueryItem] { [] }
    var headers: HTTPHeaders { [:] }
    var body: (any Encodable & Sendable)? { nil }
    var baseURL: URL { URL(string: "https://mhw-db.com")! }
    var parameterEncoding: ParameterEncodingType { .url }

    func asURLRequest() throws -> URLRequest {
        let url: URL?
        if path.hasPrefix("http") {
            url = URL(string: path)
        } else {
            var composedURL = baseURL
            path.split(separator: "/").forEach { composedURL.appendPathComponent(String($0)) }
            url = composedURL
        }

        guard var components = url.flatMap({ URLComponents(url: $0, resolvingAgainstBaseURL: false) }) else {
            throw AFError.invalidURL(url: path)
        }

        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }

        guard let finalURL = components.url else {
            throw AFError.invalidURL(url: path)
        }

        var request = URLRequest(url: finalURL)
        request.method = method
        request.headers = headers

        if let body {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try AnyEncodable(body).encoded()
        }

        return request
    }
}

private struct AnyEncodable: Encodable {
    private let encodeValue: (Encoder) throws -> Void

    init(_ value: any Encodable) {
        self.encodeValue = value.encode(to:)
    }

    func encode(to encoder: Encoder) throws {
        try encodeValue(encoder)
    }

    func encoded() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
