//
//  CourseView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 13.03.24.
//

import SwiftUI

struct CourseView: View {
    @Environment(AppVM.self) private var appVM

    @State private var vm = CourseVM()

    var body: some View {
        if let group = appVM.group {
            HStack(alignment: .top, spacing: 0) {
                ExistingCoursesView(vm: vm)
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    .background(.snow)
                    .frame(maxWidth: 370)

                VStack(alignment: .leading, spacing: 20) {
                    Text("New course for \(group.name)")
                        .font(.title)
                        .foregroundStyle(.darkest)
                    NewCourseFormView(vm: vm)
                }
                .screen(leadingPadding: 32, topPadding: 32)
            }
        } else {
            EmptyView(label: "You need to create a course group for a new course", subLabel: "The option is under group as the first item of the sidebar", systemImage: "tray.2")
        }
    }
}

#Preview(traits: traits) {
    let content = PreviewHelper.content

    return CourseView()
        .environment(content.appVM)
        .modelContainer(content.container)
}
