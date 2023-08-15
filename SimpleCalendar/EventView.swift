//
//  EventView.swift
//  SimpleCalendar
//
//  Created by Ege Sucu on 15.08.2023.
//

import SwiftUI
import EventKit

struct EventView: View {
    
    @State private var showEventDetail = false
    var event: EKEvent
    var isToday: Bool
    
    var body: some View {
        HStack {
            Text(event.title)
            Spacer()
            VStack {
                Text(isToday ? event.startDate.formatted(.dateTime.hour().minute()) : event.startDate.formatted(.dateTime))
                Text(isToday ? event.endDate.formatted(.dateTime.hour().minute()) : event.endDate.formatted(.dateTime))
            }
        }
        .contentShape(Rectangle())
        .padding(.all)
        .onTapGesture {
            showEventDetail.toggle()
        }
        .sheet(isPresented: $showEventDetail) {
            DetailView(event: event)
        }
    }
}


#Preview {
    EventView(event: .init(), isToday: true)
}
