//
//  CourseView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftData
import SwiftUI

struct NewCourseFormView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(AppVM.self) private var appVM

    @Bindable public var vm: CourseVM

    var body: some View {
        if appVM.group != nil {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    if vm.showingValidation {
                        Text("validation error")
                    }

                    VStack(alignment: .leading, spacing: 24) {
                        TextFieldV("name...", text: $vm.name, showingValidation: vm.showingValidation)
                        ColorSelectionView(selectedColor: $vm.color)
                    }
                    .frame(maxWidth: 420)
                    .section()

                    HStack(spacing: 50) {
                        DatePickerView(start: $vm.startDate, end: $vm.endDate, components: .date)
                        DatePickerView(start: $vm.startTime, end: $vm.endTime, components: .hourAndMinute)
                    }
                    .section()

                    VStack(alignment: .leading, spacing: 16) {
                        PricePickerView(price: $vm.price)
                            .frame(maxWidth: 220)
//                                KindPickerView(kind: $vm.kind)
                        TeacherSelectionView(vm: vm)
                    }
                    .section()

                    Button {
                        vm.createCourse(modelContext: modelContext, group: appVM.group)
                    } label: {
                        Text("Create")
                            .frame(width: 200)
                    }
                    .buttonStyle(Primary())
                }
                .frame(maxWidth: 600)
                .textFieldStyle(Custom())
            }
            .sheet(isPresented: $vm.showingCreateTeacherSheet) {
                CreateTeacherView()
            }
        } else {
            EmptyView(label: "Please select a course group to create courses", subLabel: "You can find the form in the first screen of the sidebar", systemImage: "tray.2")
        }
    }
}

#Preview {
    let (container, appVM) = PreviewHelper.content

    return NewCourseFormView(vm: CourseVM())
        .modelContainer(container)
        .environment(appVM)
}
