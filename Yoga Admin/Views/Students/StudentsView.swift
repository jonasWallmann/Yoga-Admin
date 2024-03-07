//
//  StudentsView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftData
import SwiftUI

struct StudentsView: View {
    @Query private var students: [Student]

    @State private var student: Student?

    var registrations: [Registration]? {
        guard let registrations = student?.registrations else { return nil }

        return registrations.isEmpty ? nil : registrations
    }

    var body: some View {
        if students.isEmpty {
            VStack(alignment: .leading) {
                Text("Students")
                    .navTitle()
                EmptyView(label: "You have not created any students yet", subLabel: "Go to 'Registration' to add students", systemImage: "person")
            }
            .screen()
        } else {
            HStack(alignment: .top, spacing: 0) {
                StudentsSearchView(selection: $student)
                    .frame(minWidth: 180, maxWidth: 240)

                VStack(alignment: .leading, spacing: 40) {
                    Text(student?.name ?? "Students")
                        .navTitle()

                    HStack(alignment: .top, spacing: 32) {
                        if let student = student {
                            if let registrations = registrations {
                                StudentCoursesView(registrations: registrations)
                                    .padding(.horizontal, -16)
                                StudentPaymentsView(registrations: registrations)
                                    .card()
                                    .padding(.top, 22)
                            } else {
                                Text("No registrations")
                                    .foregroundStyle(Color.dark)
                                    .card()
                                    .padding(.top, 22)
                            }

                            StudentPersonalInformationView(student: student)
                                .card()
                                .padding(.top, 22)
                        }
                    }
                }
                .screen()
            }
        }
    }
}

#Preview {
    let (container, appVM) = PreviewHelper.content

    return StudentsView()
        .modelContainer(container)
        .environment(appVM)
}
