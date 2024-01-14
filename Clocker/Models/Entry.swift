//
//  Entry.swift
//  Clocker
//
//  Created by Radosław Dąbrowski on 14/01/2024.
//

import Foundation

struct Entry: Codable {
    var startTime: Date
    var endTime: Date
    var breakDurationMinutes: Int
    var hourlyRate: Double
    var bonus: Double
    var earnings: Double
    var client: String
    var project: String
    var task: String
    var notes: String
}
