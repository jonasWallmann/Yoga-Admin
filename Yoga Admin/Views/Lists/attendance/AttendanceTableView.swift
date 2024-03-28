//
//  AttendanceTableView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 06.03.24.
//

import SwiftUI

class AttendanceSpacing {
    public static let HEADER_ROW_HEIGHT: CGFloat = 70
    public static let NAME_ROW_HEIGHT: CGFloat = 40
    public static let NAME_COLUMN_WIDTH: CGFloat = 200
    public static let LESSON_COLUMN_WIDTH: CGFloat = 60
}

struct AttendanceTableView: View {
    let course: Course

    private var width: CGFloat {
        AttendanceSpacing.NAME_COLUMN_WIDTH + AttendanceSpacing.LESSON_COLUMN_WIDTH * CGFloat(course.lessonCount) + 11
    }

    private var height: CGFloat {
        AttendanceSpacing.HEADER_ROW_HEIGHT + AttendanceSpacing.NAME_ROW_HEIGHT * CGFloat(course.registrationCount)
    }

    var body: some View {
        if let registrations = course.registrations {
            VStack(spacing: 0) {
                Divider()
                HStack(spacing: 0) {
                    Divider()

                    VStack(alignment: .leading, spacing: 0) {
                        AttendanceCourseInfoView(course: course)
                        AttendanceStudentListView(students: registrations.compactMap { $0.student })
                    }
                    .frame(width: AttendanceSpacing.NAME_COLUMN_WIDTH)

                    Divider()

                    ForEach(1 ..< course.lessonCount + 1, id: \.self) { number in
                        Divider()
                        LessonColumnView(course: course, number: number)
                    }
                    Divider()
                }
                .frame(maxHeight: height)

                Divider()
            }
            .frame(width: width)
        } else {
            EmptyView(label: "There are no registrations for \(course.name) on \(course.dayLong) at \(course.time)", systemImage: "person.2.slash")
        }
    }
}

#Preview(traits: .fixedLayout(width: 1000, height: 1500)) {
    let data = PreviewHelper.data

    return AttendanceTableView(course: data.course)
        .padding(52)
}
