//
//  GameLocation.swift
//  CoreModel
//
//  Created by Enric Herce on 11/11/25.
//
import Foundation

public struct GameLocation: Codable, Equatable {
    public let regionName: String
    public let areaName: String?
    public let notes: String?
}
