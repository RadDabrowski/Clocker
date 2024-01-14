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
}
