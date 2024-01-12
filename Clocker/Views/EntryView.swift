//
//  EntryView.swift
//  Clocker
//
//  Created by Radosław Dąbrowski on 09/01/2024.
//

import SwiftUI

struct EntryView: View {
    @Binding var isEntryViewPresented: Bool
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var breakDurationHours = 0
    @State private var breakDurationMinutes = 0
    
    @State private var hourlyRate = 0.0
    @State private var bonus = 0.0
    @State private var earnings = 0.0
    
    @State private var client = ""
    @State private var project = ""
    @State private var task = ""
    
    @State private var notes = ""
    
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
                    isEntryViewPresented = false
                }
                .padding()
            }
            .foregroundColor(.white)
            .background(Color.black)
            
            Form {
                Section(header: Text("Czas").foregroundColor(.white)) {
                    DatePicker("Początek", selection: $startTime, in: ...Date(), displayedComponents: [.date, .hourAndMinute])
                    DatePicker("Koniec", selection: $endTime, in: ...Date(), displayedComponents: [.date, .hourAndMinute])
                    Picker("Przerwa", selection: $breakDurationMinutes) {
                        ForEach(0..<24 * 60, id: \.self) { minute in
                            let hours = minute / 60
                            let minutes = minute % 60
                            Text("\(hours) godz. \(minutes) min.")
                        }
                    }
                    
                    .background(Color(.systemGroupedBackground))
                }
                Section(header: Text("Zarobek").foregroundColor(.white)) {
                        TextField("Stawka godzinowa (zł)", value: $hourlyRate, formatter: NumberFormatter.currency)
                        TextField("Premia (zł)", value: $bonus, formatter: NumberFormatter.currency)
                        Text("Zarobek: \(earnings, specifier: "%.2f") zł")
                            .foregroundColor(.white)
                    }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}
struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(isEntryViewPresented: .constant(true))
    }
    
}
