//
//  TimetableView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftData
import SwiftUI

struct TimetableView: View {
    @Environment(AppVM.self) private var appVM

    @State private var vm = TimetableVM()

    var body: some View {
        if let group = appVM.group {
            TimetableCoursesView(vm: vm, group: group)
                .screen(topPadding: 40)
                .environment(vm)
        } else {
            EmptyView(label: "Please select a group to show courses", subLabel: "To do so go to 'Group' at the top of the sidebar and select a group", systemImage: "tray.2")
        }
    }
}

enum TableKind: String, CaseIterable {
    case information = "Information"
    case students = "Students"
}

#Preview {
    let (container, appVM) = PreviewHelper.content

    return TimetableView()
        .modelContainer(container)
        .environment(appVM)
}
