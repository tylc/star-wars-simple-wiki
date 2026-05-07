import Foundation
import Alamofire

public enum MonsterHunterRouterError: Error, Equatable, Sendable {
    case invalidURL
}

public struct MonsterHunterRouter: BaseRouter {
    private let rootURL: URL
    private let request: MonsterHunterRequest

    public init(
        baseURL: URL = URL(string: "https://mhw-db.com")!,
        request: MonsterHunterRequest
    ) {
        self.rootURL = baseURL
        self.request = request
    }

    public var baseURL: URL {
        var url = rootURL
        if !request.language.rawValue.isEmpty {
            url.appendPathComponent(request.language.rawValue)
        }
        return url
    }

    public var path: String {
        request.endpoint.path
    }

    public var queryItems: [URLQueryItem] {
        var items: [URLQueryItem] = []
        if let query = request.query {
            items.append(URLQueryItem(name: "q", value: query))
        }
        if let projection = request.projection {
            items.append(URLQueryItem(name: "p", value: projection))
        }
        return items
    }
}
