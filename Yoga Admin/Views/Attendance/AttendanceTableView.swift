//
//  AttendanceTableView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 06.03.24.
//

import SwiftUI

class AttendanceSpacing {
    static public var headerHeight: CGFloat = 70
    static public var headerBodySpacing: CGFloat = 16
    static public let rowHeight: CGFloat = 40
}

struct AttendanceTableView: View {
    @Environment(\.colorScheme) private var colorScheme

    let course: Course

    var body: some View {
        if let registrations = course.registrations {
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: AttendanceSpacing.headerBodySpacing) {
                    courseInfo
                    studentList(students: registrations.compactMap { $0.student })
                }
                .frame(minWidth: 160)

                ForEach(1 ..< course.lessonCount + 1, id: \.self) { number in
                    Divider()
                    LessonColumnView(course: course, number: number)
                }
                Divider()
            }
            .padding(40)
        }
    }

    private var courseInfo: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(course.name)
                .font(.headline)
                .foregroundStyle(.darkest)
            Text("\(course.dayLong), \(course.time)")
                .foregroundStyle(.dark)
        }
        .padding(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: AttendanceSpacing.headerHeight)
        .background(Color.paleFor(color: course.color, scheme: colorScheme), in: RoundedRectangle(cornerRadius: 8))
        .padding(.trailing)
    }

    private func studentList(students: [Student]) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Divider()
            ForEach(students) { student in
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 4) {
                        Text(student.firstName)
                            .fontWeight(.medium)
                        Text(student.lastName)
                    }
                    Divider()
                }
                .frame(height: AttendanceSpacing.rowHeight, alignment: .bottom)
            }
        }
    }
}

#Preview {
    let data = PreviewHelper.data

    return AttendanceTableView(course: data.course)
}
