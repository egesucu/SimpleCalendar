//
//  LaterEventsView.swift
//  SimpleCalendar
//
//  Created by Ege Sucu on 15.08.2023.
//

import SwiftUI
import EventKit

struct LaterEventsView: View {
    
    var nextEvents: [EKEvent]
    
    var body: some View {
        Section {
            if nextEvents.count > 0 {
                ForEach(nextEvents, id: \.eventIdentifier) { event in
                    EventView(event: event, isToday: false)
                }
            } else {
                EmptyEventView(reason: "You don't have any planned events.")
            }
            
        } header: {
            Text("Later")
        } footer: {
            Text("\(nextEvents.count) Events")
        }
    }
}

#Preview {
    LaterEventsView(nextEvents: [])
}
