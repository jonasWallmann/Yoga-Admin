//
//  DebugView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftUI
import SwiftData

struct DebugView: View {
    @Environment(\.modelContext) private var context

    @Bindable var appVM: AppVM

    @Query private var groups: [CourseGroup]

    var body: some View {
        if groups.isEmpty {
            Button("Create sample data") {
                let group = CourseGroup(name: "2024 Q1", number: 1)
                _ = PreviewHelper.createSampleDate(context: context, group: group)

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    appVM.group = groups.first
                }
            }
            .buttonStyle(Secondary())
        } else {
            Button("Reset SwiftData") {
                appVM.group = nil

                do {
                    try context.delete(model: Registration.self)
                    try context.delete(model: CourseGroup.self)
                    try context.delete(model: Teacher.self)
                    try context.delete(model: Course.self)
                    try context.delete(model: Student.self)
                } catch {
                    print(error)
                }
            }
            .buttonStyle(Secondary())
        }
    }
}

#Preview {
    DebugView(appVM: AppVM())
        .padding()
}

