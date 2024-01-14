//
//  EntryView.swift
//  Clocker
//
//  Created by Radosław Dąbrowski on 09/01/2024.
//

import SwiftUI

struct EntryView: View {
    @Binding var isEntryViewPresented: Bool
    @StateObject var viewModel = EntryViewViewModel()
    @State private var timeEntry = Entry()
    
    var body: some View {
        VStack {
            HStack {
                Button("Anuluj") {
                    isEntryViewPresented = false
                }
                .padding()
                
                Spacer()
                
                Text("Wpis")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button("Zachowaj") {
                    viewModel.calculateEarnings()
                    viewModel.saveTimeEntry()
                    isEntryViewPresented = false
                }
                .padding()
            }
            .foregroundColor(.white)
            .background(Color.black)
            
            Form {
                Section(header: Text("Czas").foregroundColor(.white)) {
                    DatePicker("Początek", selection: $timeEntry.startTime, in: ...Date(), displayedComponents: [.date, .hourAndMinute])
                    DatePicker("Koniec", selection: $timeEntry.endTime, in: ...Date(), displayedComponents: [.date, .hourAndMinute])
                    Picker("Przerwa", selection: $timeEntry.breakDurationMinutes) {
                        ForEach(0..<24 * 60, id: \.self) { minute in
                            let hours = minute / 60
                            let minutes = minute % 60
                            Text("\(hours) godz. \(minutes) min.")
                        }
                    }
                    
                    .background(Color(.systemGroupedBackground))
                }
                Section(header: Text("Zarobek").foregroundColor(.white)) {
                    TextField("Stawka godzinowa (zł)", value: $timeEntry.hourlyRate, formatter: NumberFormatter.currency)
                    TextField("Premia (zł)", value: $timeEntry.bonus, formatter: NumberFormatter.currency)
                    Text("Zarobek: \(timeEntry.earnings, specifier: "%.2f") zł")
                            .foregroundColor(.white)
                    }
                .edgesIgnoringSafeArea(.bottom)
                Section(header: Text("Szczegóły").foregroundColor(.white)) {
                    TextField("Klient", text: $timeEntry.client)
                    TextField("Projekt", text: $timeEntry.project)
                    TextField("Zadanie", text: $timeEntry.task)
                }

                Section(header: Text("Notatki").foregroundColor(.white)) {
                    TextEditor(text: $timeEntry.notes)
                        .frame(height: 100)
                }
                
            }
        }
    }
}
struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(isEntryViewPresented: .constant(true))
    }
    
}
