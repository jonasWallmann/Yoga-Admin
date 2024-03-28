//
//  ListBodyTablesView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 08.03.24.
//

import SwiftUI

struct ListTablesView: View {
    @Environment(AppVM.self) private var appVM

    @Bindable public var vm: ListVM

    var maxRegistrationsPerCourse: Int {
        let sorted = appVM.courses.sorted(by: { $0.registrationCount > $1.registrationCount })
        let max = sorted.first?.registrationCount ?? 0

        return max == 0 ? 10 : max
    }

    var body: some View {
        if vm.courses.isEmpty {
            EmptyView(label: "Select a course from the list on the left to print the attendance list", systemImage: "list.bullet.clipboard")
        } else {
            VStack(alignment: .leading, spacing: 36) {
                HStack {
                    ListKindPickerView(selection: $vm.kind)
                    Spacer()
                    Button("Print", action: vm.print)
                        .buttonStyle(Primary())
                        .disabled(vm.courses.isEmpty)
                }
                .padding(.trailing, 20)

                ScrollView {
                    VStack(alignment: .leading, spacing: 52) {
                        ForEach(vm.courses) { course in
                            switch vm.kind {
                            case .attendance:
                                AttendanceTableView(course: course)
                                    .background(.snow)
                            case .reRegistration:
                                ReRegistrationTableView(course: course, rowCount: maxRegistrationsPerCourse)
                                    .background(.snow)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 32)
                    .padding(.trailing, 20)
                }
            }
        }
    }
}

#Preview(traits: traits) {
    let data = PreviewHelper.data

    let vm = ListVM()
    vm.newCouseSelection([data.course])

    return ListTablesView(vm: vm)
        .environment(AppVM())
        .padding(36)
}
