//
//  MonsterPart.swift
//  CoreModel
//
//  Created by Enric Herce on 11/11/25.
//

import Foundation

public struct MonsterPart: Codable, Equatable, Identifiable {
    public let id: Int
    public let kind: String
    public let health: Int
    public let multipliers: [String: Float]
}
