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

    @State private var vm = StudentsVM()

    var body: some View {
        if students.isEmpty {
            EmptyView(label: "You have not created any students yet", subLabel: "Go to 'Registration' to add students", systemImage: "person")

        } else {
            HStack(alignment: .top, spacing: 0) {
                StudentsSearchView(vm: vm)
                    .frame(minWidth: 180, maxWidth: 240)
                if let student = vm.student {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(student.name)
                            .font(.largeTitle)
                            .foregroundStyle(.darkest)

                        HStack(alignment: .top, spacing: 32) {
                            if let registrations = vm.registrations {
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
                    .frame(maxWidth: 900)
                    .screen(leadingPadding: 36, topPadding: 36)
                } else {
                    Text("")
                        .screen()
                }
                Spacer()
            }
        }
    }
}

#Preview(traits: traits) {
    let (container, appVM) = PreviewHelper.content

    return StudentsView()
        .modelContainer(container)
        .environment(appVM)
}
