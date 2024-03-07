//
//  CourseView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftData
import SwiftUI

struct CourseView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(AppVM.self) private var appVM

    @State private var vm = CourseVM()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Create Course")
                .navTitle()

                if let group = appVM.group {
                    ScrollView {

                        VStack(alignment: .leading, spacing: 30) {
                            Text("for \(group.name)")
                                .foregroundStyle(.gray)

                            if vm.showingValidation {
                                Text("validation error")
                            }

                            VStack(alignment: .leading, spacing: 24) {
                                TextFieldV("name...", text: $vm.name, showingValidation: vm.showingValidation)
                                    .frame(maxWidth: 400)
                                ColorSelectionView(selectedColor: $vm.color)
                            }
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
                            .disabled(!vm.validInput || appVM.group == nil)
                        }
                        .frame(maxWidth: 600)
                        .textFieldStyle(Custom())
                    }
                } else {
                    EmptyView(label: "Please select a course group to create courses", subLabel: "You can find the form in the first screen of the sidebar", systemImage: "tray.2")
                }
        }
        .screen()
        .sheet(isPresented: $vm.showingCreateTeacherSheet) {
            CreateTeacherView()
        }
    }
}

#Preview {
    let (container, appVM) = PreviewHelper.content

    return CourseView()
        .modelContainer(container)
        .environment(appVM)
}
