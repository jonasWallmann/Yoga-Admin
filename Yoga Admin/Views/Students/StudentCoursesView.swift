//
//  StudentCoursesView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 23.02.24.
//

import SwiftUI

struct StudentCoursesView: View {
    @Environment(AppVM.self) private var appVM

    let registrations: [Registration]

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ForEach(registrations) { registration in
                    if let course = registration.course {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(groupLabel(for: course).uppercased())
                                .font(.caption.bold())
                                .foregroundStyle(Color.dark)
                                .tracking(1.06)
                                .padding(.leading, 6)

                            CourseCardView(course: course, kind: .information, includeDay: true, teacherTag: true)
                                .frame(width: 140)
                        }
                    }
                }
            }
            .padding(.horizontal, 12)
        }
        .scrollIndicators(.hidden)
    }

    private func groupLabel(for course: Course) -> String {
        guard let group = course.group else { return "unknown group" }

        return appVM.group == group ? "Current" : group.name
    }
}

#Preview {
    let student = PreviewHelper.data.student

    return StudentCoursesView(registrations: student.registrations ?? [])
        .environment(AppVM())
}
