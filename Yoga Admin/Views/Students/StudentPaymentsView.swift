//
//  StudentPaymentsView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 23.02.24.
//

import SwiftUI

struct StudentPaymentsView: View {
    let registrations: [Registration]

    var sortedRegistrations: [Registration] {
        registrations.sorted(by: { $0.timestamp > $1.timestamp })
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Payments")
                .font(.headline)
            Divider()

            VStack(alignment: .leading, spacing: 20) {
                ForEach(sortedRegistrations) { registration in
                    StudentPaymentsRowView(registration: registration)
                }
            }
        }
    }
}


#Preview {
    let student = PreviewHelper.data.student

    return StudentPaymentsView(registrations: student.registrations ?? [])
}
