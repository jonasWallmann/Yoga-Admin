//
//  TimetableBodyView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 21.02.24.
//

import SwiftData
import SwiftUI

struct TimetableCoursesView: View {
    @Environment(\.modelContext) private var modelContext

    @Bindable var vm: TimetableVM

    let group: CourseGroup

    private var courses: [Course] {
        group.courses ?? []
    }

    var body: some View {
        if courses.isEmpty {
            EmptyView(
                label: "There are no registrations for \(group.name)",
                subLabel: "Go to 'Registration' to add students",
                systemImage: "table"
            )
        } else {
            VStack(alignment: .leading, spacing: 40) {
                TableKindPickerView(selection: $vm.kind)

                TimetableBodyView(timeRows: vm.timeRows, dayCount: vm.days.count, kind: vm.kind)
                    .onAppear {
                        vm.create(for: courses)
                    }
                    .onChange(of: courses) { _, newCourses in
                        vm.create(for: newCourses)
                    }
            }
        }
    }
}

#Preview {
    let (container, appVM) = PreviewHelper.content

    return TimetableCoursesView(vm: TimetableVM(), group: CourseGroup(name: "2024 Q1", number: 1))
        .modelContainer(container)
        .environment(appVM)
}
