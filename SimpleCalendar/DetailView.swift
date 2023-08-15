//
//  DetailView.swift
//  SimpleCalendar
//
//  Created by Ege Sucu on 15.08.2023.
//

import SwiftUI
import EventKit

struct DetailView: View {
    
    @Environment(\.dismiss) var dismiss
    var event: EKEvent
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                Text("Event Detail")
                    .bold()
                    .font(.title)
                    .padding()
                EventDetailView(event: event)
            }
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .offset(x: -10, y: 10)
            }
            
        }
    }
}

#Preview {
    DetailView(event: EKEvent())
}
