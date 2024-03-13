//
//  CourseCheckboxView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 07.03.24.
//

import SwiftUI

struct CourseCheckboxView: View {
    @Environment(CourseSelectionsVM.self) private var vm

    let course: Course

    @State private var isSelected: Bool = false

    var body: some View {
        CheckBox(label: course.name, addition: course.time, isSelected: $isSelected)
            .onChange(of: isSelected) { _, newIsSelected in
                vm.course(course, isIncluded: newIsSelected)
            }
            .onChange(of: vm.selectedCourses) { _, newCourses in
                if isSelected != newCourses.contains(course) {
                    self.isSelected.toggle()
                }
            }
            .onAppear {
                isSelected = vm.selectedCourses.contains(course)
            }
    }
}

#Preview {
    let data = PreviewHelper.data

    func doSomething(with courses: [Course]) {}

    return CourseCheckboxView(course: data.course)
        .environment(CourseSelectionsVM(courses: [data.course], selectionCallback: doSomething))
        .padding()
}
