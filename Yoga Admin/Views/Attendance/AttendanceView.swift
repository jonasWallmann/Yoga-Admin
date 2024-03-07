//
//  AttendanceView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 07.03.24.
//

import SwiftUI

struct AttendanceView: View {
    @Environment(AppVM.self) private var appVM

    @State private var vm = CourseSelectionsVM()

    var body: some View {
        if appVM.courses.isEmpty {
            empty
        } else {
            HStack(alignment: .top, spacing: 0) {
                Group {
                    if let group = appVM.group {
                        ScrollView {
                            CourseSelectionsView(group: group)
                                .environment(vm)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    } else {
                        Label("Please create a course group", systemImage: "tray.2")
                    }
                }
                .padding(.horizontal)
                .padding(.top, 36)
                .frame(minWidth: 200, maxWidth: 220, alignment: .leading)
                .background(Color.snow)

                Group {
                    if vm.selectedCourses.isEmpty {
                        EmptyView(label: "Select a course from the list on the left to print the attendance list", systemImage: "list.bullet.clipboard")
                    } else {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 52) {
                                ForEach(vm.selectedCourses) { course in
                                    AttendanceTableView(course: course)
                                        .background(.snow)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 32)
                        }
                    }
                }
                .padding(.leading)
                .screen(topPadding: 0)
            }
            .onDisappear {
                vm.courses(areIncluded: false)
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

    return AttendanceView()
        .modelContainer(content.container)
        .environment(content.appVM)
}
