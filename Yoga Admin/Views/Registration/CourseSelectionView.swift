//
//  CourseSelectionView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 18.02.24.
//

import SwiftData
import SwiftUI

struct CourseSelectionView: View {
    @Binding var selection: Course?

    var group: CourseGroup?

    private var courses: [Course] {
        group?.courses ?? []
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Course")
                .font(.headline)
                .foregroundStyle(Color.darkest)
            Divider()
                .padding(.trailing, 24)

            if courses.isEmpty {
                Label("Create a course to register a student", systemImage: "list.bullet.clipboard")
                    .foregroundStyle(Color.dark)
                    .padding(.bottom, 20)
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 26) {
                        ForEach(0 ..< 7) { day in
                            let courses = onDay(day)
                            
                            if !courses.isEmpty {
                                VStack(alignment: .leading, spacing: 12) {
                                    Text(Calendar.dayNames[day].uppercased())
                                        .foregroundStyle(Color.darkest)
                                        .font(.caption.bold())
                                        .tracking(0.8)
                                    
                                    ForEach(courses) { course in
                                        DotOption(label: course.name, addition: course.time, isSelected: selection == course) {
                                            selection = course
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 28)
                    .padding(.trailing, 24)
                }
            }
        }
    }

    private func onDay(_ day: Int) -> [Course] {
        courses.filter { course in
            Calendar.weekday(from: course.start) == day
        }
        .sorted(by: { Calendar.hour(from: $0.start) < Calendar.hour(from: $1.start) })
    }

    private func dot(for course: Course) -> String {
        course == selection ? "smallcircle.filled.circle" : "circle"
    }
}

#Preview {
    let content = PreviewHelper.content

    return CourseSelectionView(selection: .constant(nil), group: CourseGroup(name: "2024 Q1", number: 1))
        .modelContainer(content.container)
        .environment(content.appVM)
}
