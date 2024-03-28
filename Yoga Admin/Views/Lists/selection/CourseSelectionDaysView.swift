//
//  CourseSelectionDaysView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 08.03.24.
//

import SwiftUI

struct CourseSelectionDaysView: View {
    @Environment(CourseSelectionsVM.self) private var vm

    var body: some View {
        VStack(spacing: 26) {
            ForEach(0 ..< 7) { dayIndex in
                let courses = Course.onDay(dayIndex, courses: vm.courses)

                if courses.isEmpty == false {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(Calendar.dayNames[dayIndex].uppercased())
                            .tagLine()

                        ForEach(courses) { course in
                            CourseCheckboxView(course: course)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    let data = PreviewHelper.data

    func doSomething(with courses: [Course]) { }

    return CourseSelectionDaysView()
        .environment(CourseSelectionsVM(courses: [data.course], selectionCallback: doSomething))
}
