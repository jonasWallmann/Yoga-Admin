//
//  ListView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 08.03.24.
//

import SwiftUI

struct ListView: View {
    @Environment(AppVM.self) private var appVM

    @State private var vm = ListVM()

    var body: some View {
        if appVM.courses.isEmpty {
            empty
        } else {
            HStack(alignment: .top, spacing: 0) {
                CourseSelectionsView(vm: CourseSelectionsVM(courses: appVM.courses, selectedCourses: vm.courses,  selectionCallback: vm.newCouseSelection))
                ListTablesView(vm: vm)
                    .screen(leadingPadding: 36)
            }
        }
    }

    private var empty: some View {
        Group {
            if let group = appVM.group {
                EmptyView(label: "There are no courses in \(group.name)", subLabel: "You can add courses in the course tab of the sidebar", systemImage: "clipboard")
            } else {
                EmptyView(label: "No course group selected", subLabel: "You can create a new course group in the first item of the sidebar", systemImage: "tray.2")
            }
        }
        .screen()
    }
}

#Preview(traits: traits) {
    let content = PreviewHelper.content

    return ListView()
        .environment(content.appVM)
}
