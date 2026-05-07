import Foundation

enum DTOMapper {
    static func map<DTO: Encodable, Model: Decodable>(_ dto: DTO, to type: Model.Type) throws -> Model {
        let data = try JSONEncoder().encode(dto)
        return try JSONDecoder().decode(Model.self, from: data)
    }
}
