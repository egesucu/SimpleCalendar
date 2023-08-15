//
//  EventListView.swift
//  SimpleCalendar
//
//  Created by Ege Sucu on 15.08.2023.
//

import SwiftUI
import EventKit

struct EventListView: View {
    
    @StateObject private var manager = EventManager()
    
    var todaysEvents: [EKEvent] {
        return manager.events.filter { event in
            return Calendar.current.isDateInToday(event.startDate)
        }
    }
    
    var nextEvents: [EKEvent] {
        return manager.events.filter { event in
            return !(Calendar.current.isDateInToday(event.startDate))
        }
    }
    
    var body: some View {
        NavigationStack {
            switch manager.eventStatus {
            case .notDetermined:
                EmptyEventView(reason: "Allow us to list your events.")
            case .denied:
                EmptyEventView(reason: "You did not allow us to show events.")
            case .restricted:
                EmptyEventView(reason: "You restricted our access.")
            case .fullAccess:
                eventListView
            case .authorized:
                eventListView
            default:
                EmptyView()
            }
        }
        .task {
            await manager.fetchEvents()
        }
    }
    
    

    @ViewBuilder
    var eventListView: some View {
        if manager.events.count > 0 {
            List {
                TodaysEventsView(todaysEvents: todaysEvents)
                LaterEventsView(nextEvents: nextEvents)
            }
            .navigationTitle(Text("Events"))
            
        } else {
            EmptyEventView(reason: "You don't have any event")
        }
    }
}

#Preview {
    EventListView()
}
