//
//  ContentView.swift
//  Clocker
//

import SwiftUI

struct MainView: View {
    @State private var currentTime = ""
    @State private var isEntryViewPresented: Bool = false
    @State private var showEntryView: Bool = false
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.blue)
            }
            
            Text(currentTime)
            
                .font(.system(size: 50))
                .onAppear {
                    self.currentTime = getCurrentTime()
                }
                .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                    self.currentTime = getCurrentTime()
                }
            Text(getDayAndDate())
                .font(.subheadline)
            
            Button(action: {
                showEntryView = true
            }) {
                Text("Zapisywanie czasu")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showEntryView) {
                EntryView(isEntryViewPresented: $showEntryView)
            }
            
            
            Spacer()
            HStack {
                NavigationLink(destination: MainView()) {
                    VStack {
                        Image(systemName: "stopwatch")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Start")
                    }
                    .foregroundColor(Color.white)
                }
                .padding()
                
                NavigationLink(destination: SummaryView()) {
                    VStack {
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Zestawienia")
                            .lineLimit(1)
                            .multilineTextAlignment(.center)
                    }
                    .foregroundColor(Color.white)
                }
                .padding()
                NavigationLink(destination: AdministrationView()) {
                    VStack {
                        Image(systemName: "archivebox")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Administracja")
                            .lineLimit(1)
                            .multilineTextAlignment(.center)
                    }
                    .foregroundColor(Color.white)
                }
                .padding()
                
                NavigationLink(destination: MoreView()) {
                    VStack {
                        Image(systemName: "ellipsis")
                            .resizable()
                            .frame(width: 30, height: 10)
                            .padding(10)
                        Text("Więcej")
                    }
                    .foregroundColor(Color.white)
                }
                .padding()
                Spacer()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .foregroundColor(Color.white)
        }
    }
    
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: Date())
    }
    
    func getDayAndDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd.MM"
        return formatter.string(from: Date())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
