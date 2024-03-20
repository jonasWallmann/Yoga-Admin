//
//  CreateCourseGroupView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftData
import SwiftUI

struct CreateGroupFormView: View {
    @Environment(\.modelContext) private var modelContext

    @Environment(AppVM.self) private var appVM

    @Query private var groups: [CourseGroup]

    @State private var name = String()
    @State private var number = 1.0

    @State private var showingValidation = false

    private var nameExists: Bool {
        groups.contains(where: { $0.name == name })
    }

    private var numberExists: Bool {
        groups.contains(where: { $0.number == number })
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("New")
                .bold()

            if nameExists {
                Label("The name '\(name)' already exists", systemImage: "xmark.circle.fill")
            }
            if numberExists {
                Label("The number '\(number)' already exists", systemImage: "xmark.circle.fill")
            }

            TextFieldV("name", text: $name, showingValidation: showingValidation)

//                HStack(spacing: 20) {
//                    Text("Number")
//                    TextField("number", value: $number, format: .number)
//                        .frame(width: 50)
//                        .multilineTextAlignment(.center)
//                    Spacer()
//                    Stepper("number", value: $number)
//                        .labelsHidden()
//                }

            Button {
                createGroup()
            } label: {
                Text("Create")
                    .frame(maxWidth: 140)
            }
            .buttonStyle(Primary())
            .disabled(name.isEmpty || nameExists || numberExists)
        }
        .frame(maxWidth: 285)
        .onAppear {
            guard let highest = groups.max(by: { $0.name < $1.name}) else { return }

            number = highest.number + 1
        }
    }

    private func createGroup() {
        if name.isEmpty || nameExists || numberExists { return }

        let newGroup = CourseGroup(name: name, number: number)
        modelContext.insert(newGroup)
        appVM.group = newGroup

        name = String()
        number += 1
    }
}

#Preview {
    let (container, appVM) = PreviewHelper.content

    return CreateGroupFormView()
        .modelContainer(container)
        .environment(appVM)
        .padding()
}
