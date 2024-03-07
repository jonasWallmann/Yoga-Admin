//
//  AttendanceCourseInfoView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 07.03.24.
//

import SwiftUI

struct AttendanceCourseInfoView: View {
    @Environment(\.colorScheme) private var colorScheme

    let course: Course

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(course.name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.darkest)
            Text("\(course.dayLong), \(course.time)")
                .foregroundStyle(.dark)
        }
        .padding(.leading, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: AttendanceSpacing.HEADER_ROW_HEIGHT)
        .background(Color.paleFor(color: course.color, scheme: colorScheme))
    }
}

#Preview {
    let data = PreviewHelper.data

    return AttendanceCourseInfoView(course: data.course)
}
