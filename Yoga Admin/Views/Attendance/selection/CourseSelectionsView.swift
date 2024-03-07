//
//  CourseSelectionsView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 07.03.24.
//

import SwiftUI

struct CourseSelectionsView: View {
    @Environment(CourseSelectionsVM.self) private var vm

    let group: CourseGroup

    private var courses: [Course] {
        group.courses ?? []
    }

    @State private var selectAll: Bool = false

    @State private var ignoreSelectAllChange: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 26) {
            CheckBox(label: "Select all", isSelected: $selectAll)
                .onChange(of: selectAll) { _, newValue in
                    if ignoreSelectAllChange == false {
                        vm.courses(courses, areIncluded: newValue)
                    }
                }
                .onChange(of: vm.selectedCourses) { _, newValue in
                    if courses.count != newValue.count {
                        ignoreSelectAllChange = true
                        selectAll = false

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                            self.ignoreSelectAllChange = false
                        }
                    }
                }

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
    }

    private func onDay(_ day: Int) -> [Course] {
        courses.filter { course in
            Calendar.weekday(from: course.start) == day
        }
        .sorted(by: { Calendar.hour(from: $0.start) < Calendar.hour(from: $1.start) })
    }
}

#Preview(traits: .fixedLayout(width: 280, height: 1000)) {
    let data = PreviewHelper.content

    return CourseSelectionsView(group: data.appVM.group!)
        .environment(CourseSelectionsVM())
        .padding()
        .background(.white)
}
