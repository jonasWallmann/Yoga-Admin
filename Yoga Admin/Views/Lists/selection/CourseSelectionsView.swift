//
//  CourseSelectionsView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 07.03.24.
//

import SwiftUI

struct CourseSelectionsView: View {
    @State public var vm: CourseSelectionsVM

    @State private var selectAll: Bool = false

    @State private var ignoreSelectAllChange: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 26) {
                CheckBox(label: "Select all", isSelected: $selectAll)
                    .onChange(of: selectAll) { _, newValue in
                        toggleSelectAll(to: newValue)
                    }
                    .onChange(of: vm.selectedCourses) { _, newCourses in
                        toggleSelectAll(for: newCourses)
                    }

                CourseSelectionDaysView()
                    .environment(vm)
            }
            .padding(.top, 36)
            .padding(.bottom, 20)
            .padding(.horizontal)
        }
        .frame(minWidth: 200, maxWidth: 220, alignment: .leading)
        .background(Color.snow)
        .onChange(of: vm.selectedCourses) { _, newCourses in
            vm.selectionCallback(newCourses)
        }
    }

    private func toggleSelectAll(to value: Bool) {
        if ignoreSelectAllChange == false {
            vm.courses(vm.courses, areIncluded: value)
        }
    }

    private func toggleSelectAll(for newCourses: [Course]) {
        ignoreSelectAllChange = true
        selectAll = vm.courses.count == newCourses.count

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
            self.ignoreSelectAllChange = false
        }
    }
}

#Preview(traits: .fixedLayout(width: 280, height: 1000)) {
    let data = PreviewHelper.data

    func doSomething(with _: [Course]) {}

    return CourseSelectionsView(vm: CourseSelectionsVM(courses: [data.course], selectionCallback: doSomething))
}
