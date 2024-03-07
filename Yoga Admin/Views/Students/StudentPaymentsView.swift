//
//  StudentPaymentsView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 23.02.24.
//

import SwiftUI

struct StudentPaymentsView: View {
    let registrations: [Registration]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Payments")
                .font(.headline)
            Divider()

            VStack(alignment: .leading, spacing: 20) {
                ForEach(registrations) { registration in
                    if let course = registration.course {
                        CheckBox(
                            label: "\(course.price) €",
                            addition: "for \(course.name) in \(course.group?.name ?? "unknown group")",
                            isSelected: registration.paid) {
                                registration.paid.toggle()
                            }
                    } else {
                        Text("Error: Registration without course.")
                    }
                }
            }
        }
    }
}

#Preview {
    let student = PreviewHelper.data.student

    return StudentPaymentsView(registrations: student.registrations ?? [])
}
