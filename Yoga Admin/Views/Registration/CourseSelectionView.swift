//
//  CourseSelectionView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 18.02.24.
//

import SwiftData
import SwiftUI

private let LEADING_PADDING: CGFloat = 24

struct CourseSelectionView: View {
    @Binding var selection: Course?

    var group: CourseGroup?

    let showingValidationError: Bool

    private var courses: [Course] {
        group?.courses ?? []
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Group {
                Text("Course")
                    .font(.headline)
                    .foregroundStyle(Color.darkest)

                if showingValidationError && selection == nil {
                     ErrorLabel("Please select a course")
                }

                Divider()
                    .padding(.trailing, 24)
                    .padding(.bottom, 4)
            }
            .padding(.leading, LEADING_PADDING)

            if courses.isEmpty {
                Label("Create a course to register a student", systemImage: "list.bullet.clipboard")
                    .foregroundStyle(Color.dark)
                    .padding(.bottom, 20)
                    .padding(.leading, LEADING_PADDING)
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(0 ..< 7) { day in
                            let courses = Course.onDay(day, courses: courses)

                            if courses.isEmpty == false {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(Calendar.dayNames[day].uppercased())
                                        .tagLine()
                                        .padding(.leading, LEADING_PADDING)

                                    ForEach(courses) { course in
                                        DotOption(label: course.name, addition: course.time, isSelected: selection == course, hPadding: LEADING_PADDING, vPadding: 8) {
                                            selection = course
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 28)
                }
            }
        }
    }

    private func dot(for course: Course) -> String {
        course == selection ? "smallcircle.filled.circle" : "circle"
    }
}

#Preview {
    let data = PreviewHelper.data

    @State var selection: Course? = data.course

    return CourseSelectionView(selection: $selection, group: data.group, showingValidationError: false)
        .padding(.top, 24)
        .background(.snow)
}
