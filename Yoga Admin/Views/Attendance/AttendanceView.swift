//
//  AttendanceView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 07.03.24.
//

import SwiftUI

struct AttendanceView: View {
    @Environment(AppVM.self) private var appVM

    @State private var course: Course?

    var body: some View {
        HStack(alignment: .top, spacing: 40) {
            CourseSelectionView(selection: $course, group: appVM.group)
                .padding(.leading)

            if let course = course {
                AttendanceTableView(course: course)
            }
        }
    }
}

#Preview {
    let content = PreviewHelper.content

    return AttendanceView()
        .modelContainer(content.container)
        .environment(content.appVM)
}
