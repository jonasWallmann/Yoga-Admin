//
//  TeacherSelectionView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftData
import SwiftUI

struct TeacherSelectionView: View {
    @Query private var teachers: [Teacher]

    @Bindable var vm: CourseVM

    var body: some View {
        HStack {
            HStack {
                Text("Teacher")
                    .font(.headline)

                Spacer()

                if teachers.isEmpty {
                    newButton
                } else {
                    Picker("teacher", selection: $vm.teacher) {
                        Text("select").tag(nil as Teacher?)
                        Divider()

                        ForEach(teachers) { teacher in
                            Text(teacher.firstName).tag(teacher as Teacher?)
                        }
                    }
                    .labelsHidden()
                    .frame(width: 125)
                }
            }
            .frame(width: 220)

            if !teachers.isEmpty {
                Spacer()
                newButton
            }
        }
    }

    private var newButton: some View {
        Button("New teacher") {
            vm.showingCreateTeacherSheet = true
        }
        .buttonStyle(Tertiary())
    }
}

#Preview {
    let content = PreviewHelper.content

    return TeacherSelectionView(vm: CourseVM())
        .modelContainer(content.container)
}
