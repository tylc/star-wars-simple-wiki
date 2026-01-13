//
//  File.swift
//  CoreData
//
//  Created by Enric Herce on 13/1/26.
//

import Foundation

enum BaseURL {
    case monsters
    case monster(id: Int)

    public var url: URL {
        switch self {
        case .monsters:
            return URL(string: "https://mhw-db.com/monsters")!
        case .monster(let id):
            return URL(string: "https://mhw-db.com/monsters/\(id)")!
        }
    }
}
