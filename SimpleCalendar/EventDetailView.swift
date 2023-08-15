//
//  EventDetailView.swift
//  SimpleCalendar
//
//  Created by Ege Sucu on 15.08.2023.
//

import SwiftUI
import EventKit
import EventKitUI

struct EventDetailView: UIViewControllerRepresentable {
    
    var event: EKEvent
    @Environment(\.dismiss) var dismiss
    
    typealias UIViewControllerType = EKEventViewController
    
    func makeUIViewController(context: Context) -> EKEventViewController {
        let viewController = EKEventViewController()
        viewController.event = event
        viewController.delegate = context.coordinator
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: EKEventViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, EKEventViewDelegate {
        
        var view: EventDetailView
        
        init(_ view: EventDetailView) {
            self.view = view
        }
        func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
            if action == .done {
                view.dismiss()
            }
        }
    }
}
