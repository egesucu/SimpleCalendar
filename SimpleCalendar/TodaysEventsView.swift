//
//  TodaysEventsView.swift
//  SimpleCalendar
//
//  Created by Ege Sucu on 15.08.2023.
//

import SwiftUI
import EventKit

struct TodaysEventsView: View {
    
    var todaysEvents: [EKEvent]
    
    var body: some View {
        Section {
            if todaysEvents.count > 0 {
                ForEach(todaysEvents, id: \.eventIdentifier) { event in
                    EventView(event: event, isToday: true)
                }
            } else {
                EmptyEventView(reason: "You don't have any event today.")
            }
        } header: {
            Text("Today")
        } footer: {
            Text("\(todaysEvents.count) Events")
        }
    }
}

#Preview {
    TodaysEventsView(todaysEvents: [])
}
