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
                        VStack(alignment: .leading, spacing: 8) {
                            Text(groupLabel(for: course).uppercased())
                                .font(.caption.bold())
                                .foregroundStyle(Color.dark)

                            CourseCardView(course: course, kind: .information, includeDay: true)
                                .frame(width: 132)
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