//
//  LessonColumnView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 07.03.24.
//

import SwiftUI

struct LessonColumnView: View {
    let course: Course
    let number: Int

    var date: String {
        guard let date = Calendar.current.date(byAdding: .day, value: number * 7, to: course.start) else { return "unknown" }

        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM"
        return formatter.string(from: date)
    }

    var registrations: [Registration] {
        course.registrations ?? []
    }

    var body: some View {
        VStack(spacing: AttendanceSpacing.headerBodySpacing) {
            VStack(spacing: 16) {
                Text(number.description)
                    .font(.title2)
                    .foregroundStyle(.darkest)
                Text(date)
                    .foregroundStyle(.dark)
            }
            .frame(height: AttendanceSpacing.headerHeight)

            VStack(spacing: 0) {
                Divider()
                ForEach(registrations) { _ in
                    Divider()
                        .frame(height: AttendanceSpacing.rowHeight, alignment: .bottom)
                }
            }
        }
    }
}

#Preview {
    let data = PreviewHelper.data

    return LessonColumnView(course: data.course, number: 1)
        .padding(40)
}
