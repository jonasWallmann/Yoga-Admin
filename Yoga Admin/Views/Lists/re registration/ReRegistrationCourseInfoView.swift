//
//  ReRegistrationCourseInfoView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 09.03.24.
//

import SwiftUI

struct ReRegistrationCourseInfoView: View {
    @Environment(\.colorScheme) private var colorScheme

    let course: Course

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(course.name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.darkest)
            VStack(alignment: .leading, spacing: 8) {
                Text("\(course.dayLong), \(course.time)")
                Text(course.dates)
            }
            .foregroundStyle(.dark)
        }
        .padding(.leading, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 12)
        .background(Color.paleFor(color: course.color, scheme: colorScheme))
    }
}

#Preview {
    let data = PreviewHelper.data

    return ReRegistrationCourseInfoView(course: data.course)
}
