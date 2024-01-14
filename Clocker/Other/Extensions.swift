//
//  Extensions.swift
//  Clocker
//
//  Created by Radosław Dąbrowski on 09/01/2024.
//

import Foundation
extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        return formatter
    }
}

extension Entry {
    init() {
        self.startTime = Date()
        self.endTime = Date()
        self.breakDurationMinutes = 0
        self.hourlyRate = 0.0
        self.bonus = 0.0
        self.earnings = 0.0
        self.client = ""
        self.project = ""
        self.task = ""
        self.notes = ""
    }
}
