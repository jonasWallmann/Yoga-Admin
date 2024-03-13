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
                let courses = onDay(dayIndex)

                if courses.isEmpty == false {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(Calendar.dayNames[dayIndex].uppercased())
                            .foregroundStyle(Color.darkest)
                            .font(.caption.bold())
                            .tracking(0.8)

                        ForEach(courses) { course in
                            CourseCheckboxView(course: course)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func onDay(_ day: Int) -> [Course] {
        vm.courses.filter { course in
            Calendar.weekday(from: course.start) == day
        }
        .sorted(by: { Calendar.hour(from: $0.start) < Calendar.hour(from: $1.start) })
    }

}

#Preview {
    let data = PreviewHelper.data

    func doSomething(with courses: [Course]) { }

    return CourseSelectionDaysView()
        .environment(CourseSelectionsVM(courses: [data.course], selectionCallback: doSomething))
}
