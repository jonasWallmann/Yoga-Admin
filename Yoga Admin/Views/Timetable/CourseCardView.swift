//
//  CourseCardView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 20.02.24.
//

import SwiftUI

struct CourseCardView: View {
    @Environment(\.colorScheme) private var colorScheme

    let course: Course?
    let kind: TableKind

    var includeDay: Bool = false
    var teacherTag: Bool = false

    private var registrations: [Registration]? {
        let sorted = course?.registrations?.sorted(by: { left, right in
            guard let leftName = left.student?.name, let rightName = right.student?.name else { return true }

            return leftName < rightName
        })
        return (sorted?.isEmpty ?? true) ? nil : sorted
    }

    var body: some View {
        if let course = course {
            VStack(alignment: .leading, spacing: 12) {
                Text(course.name)
                    .padding(.leading)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 8)
                    .background(Color.paleFor(color: course.color, scheme: colorScheme))

                Group {
                    switch kind {
                    case .information:
                        Text("\(teacherTag ? "by " : "")\(course.teacher?.firstName ?? "no teacher")")

                        VStack(alignment: .leading, spacing: 12) {
                            if includeDay {
                                Text("\(course.day), \(course.dates)")
                            } else {
                                Text(course.dates)
                            }

                            Text(course.times)
                        }
                        .font(.system(size: 12))
                    case .students:
                        if let registrations = registrations {
                            VStack(alignment: .leading, spacing: 12) {
                                ForEach(Array(registrations.enumerated()), id: \.element) { index, registration in
                                    HStack {
                                        Text("\(index + 1).")
                                            .frame(width: 18, alignment: .trailing)
                                        Text(registration.student?.firstName ?? "unknown")
                                    }
                                }
                            }
                        } else {
                            Text("-")
                        }
                    }
                }
                .foregroundStyle(Color.dark)
                .padding(.leading)
            }
            .padding(.bottom, 16)
            .card(hasPadding: false)
        } else {
            Rectangle()
                .frame(height: 1)
                .opacity(0)
        }
    }
}

#Preview {
    let data = PreviewHelper.data

    return HStack(alignment: .top, spacing: 60) {
        CourseCardView(course: data.course, kind: .information)
            .frame(maxWidth: 120)
        CourseCardView(course: data.course, kind: .students)
            .frame(maxWidth: 120)
    }
    .frame(maxWidth: 300)
}
