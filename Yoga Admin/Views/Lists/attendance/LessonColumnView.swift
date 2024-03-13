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
        VStack(spacing: 0) {
            VStack(spacing: 8) {
                Text(number.description)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.darkest)
                Text(date)
                    .foregroundStyle(.dark)
            }
            .frame(height: AttendanceSpacing.HEADER_ROW_HEIGHT)

            VStack(spacing: 0) {
//                Divider()
                ForEach(registrations) { _ in
                    Divider()
                        .frame(height: AttendanceSpacing.NAME_ROW_HEIGHT, alignment: .top)
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
