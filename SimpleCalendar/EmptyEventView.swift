//
//  EmptyEventView.swift
//  SimpleCalendar
//
//  Created by Ege Sucu on 15.08.2023.
//

import SwiftUI

struct EmptyEventView: View {

    var reason: LocalizedStringResource

    var body: some View {
        Text(reason)
    }
}

#Preview {
    EmptyEventView(reason: "")
}
