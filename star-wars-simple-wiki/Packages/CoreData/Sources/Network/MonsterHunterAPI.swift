//
//  File.swift
//  CoreData
//
//  Created by Enric Herce on 13/1/26.
//

import Foundation
import CoreModel
import Alamofire

protocol MonsterHunterAPIProtocol {
    func fetchMonsters() async throws -> [Monster]
    func fetchMonster(_ id: Int) async throws -> Monster?
}
class MonsterHunterAPI {
    func fetchMonsters() async throws -> [MonsterDTO] {
        let url = BaseURL.monsters.url
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: [MonsterDTO].self) { response in
                    switch response.result {
                    case .success(let dtos):
                        continuation.resume(returning: dtos)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
        
        func fetchMonster(_ id: Int) async throws -> MonsterDTO? {
            let url = BaseURL.monster(id: id).url
            return try await withCheckedThrowingContinuation { continuation in
                AF.request(url)
                    .validate(statusCode: 200..<300)
                    .responseDecodable(of: MonsterDTO.self) { response in
                        switch response.result {
                        case .success(let dtos):
                            continuation.resume(returning: dtos)
                        case .failure(let error):
                            continuation.resume(throwing: error)
                        }
                    }
            }
        }
    }
}
