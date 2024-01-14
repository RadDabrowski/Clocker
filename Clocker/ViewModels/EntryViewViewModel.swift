//
//  EntryViewViewModel.swift
//  Clocker
//
//  Created by Radosław Dąbrowski on 14/01/2024.
//

import Foundation

class EntryViewViewModel: ObservableObject {
    @Published var timeEntry: Entry

    init() {
        self.timeEntry = Entry()
    }

    func saveTimeEntry() {
        if let encodedData = try? JSONEncoder().encode(timeEntry) {
            UserDefaults.standard.set(encodedData, forKey: "savedTimeEntry")
        }
    }
    func calculateEarnings() {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.hour, .minute], from: timeEntry.startTime, to: timeEntry.endTime)
            let hoursWorked = Double(components.hour ?? 0) + Double(components.minute ?? 0) / 60.0

            let baseEarnings = hoursWorked * timeEntry.hourlyRate

            let totalEarnings = baseEarnings + timeEntry.bonus

            timeEntry.earnings = totalEarnings
        }
}
