//
//  EventManager.swift
//  SimpleCalendar
//
//  Created by Ege Sucu on 15.08.2023.
//

import Foundation
import EventKit

class EventManager: ObservableObject {
    @Published var events: [EKEvent] = []
    @Published var eventStatus: EKAuthorizationStatus = .notDetermined
    
    let eventStore = EKEventStore()
    
    init() {
        askUserRequest()
    }
    
    private func askUserRequest() {
        eventStore.requestFullAccessToEvents { [weak self] success, error in
            if let error = error {
                self?.handleStatus(status: .denied)
                self?.handleError(error: error)
            } else {
                if success {
                    self?.handleStatus(status: .fullAccess)
                }
            }
        }
    }
    
    private func handleStatus(status: EKAuthorizationStatus) {
        DispatchQueue.main.async {
            self.eventStatus = status
        }
    }
    
    private func handleError(error: Error) {
        print(error.localizedDescription)
    }
    
    func fetchEvents() async {
        if eventStatus == .fullAccess {
            let calendars = eventStore.calendars(for: .event)
            let startDate: Date = Calendar.current.startOfDay(for: .now)
            /// 60(sec) * 60(min) * 24(hours) * 30(days) = 2_592_000
            let oneMonthInMilliSeconds: Double = 2_592_000
            let endDate: Date = .now.addingTimeInterval(oneMonthInMilliSeconds)
            DispatchQueue.main.async {
                let predicate = self.eventStore.predicateForEvents(
                    withStart: startDate,
                    end: endDate,
                    calendars: calendars
                )
                self.events = self.eventStore.events(matching: predicate)
            }
        }
    }
}
