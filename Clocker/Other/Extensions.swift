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
