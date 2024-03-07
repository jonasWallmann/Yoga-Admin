//
//  StudentPaymentsRowView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 07.03.24.
//

import SwiftUI

struct StudentPaymentsRowView: View {
    let registration: Registration

    @State private var isPaid: Bool

    init(registration: Registration) {
        self.registration = registration
        self.isPaid = registration.paid
    }

    var body: some View {
        if let course = registration.course {
            CheckBox(label: "\(course.price) € for \(course.name) in \(course.group?.name ?? "unknown group")", isSelected: $isPaid)
            .onChange(of: isPaid) { _, newValue in
                registration.paid = newValue
            }
        } else {
            Text("Error: Registration without course.")
        }
    }
}

#Preview {
    let data = PreviewHelper.data
    let registration = Registration(note: "", student: data.student, course: data.course)

    return StudentPaymentsRowView(registration: registration)
}
