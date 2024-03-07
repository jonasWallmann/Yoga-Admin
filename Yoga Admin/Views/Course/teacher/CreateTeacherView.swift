//
//  CreateTeacherView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftUI
import SwiftData

struct CreateTeacherView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var firstName = String()
    @State private var lastName = String()

    @State private var email = String()
    @State private var phone = String()

    @State private var address1 = String()
    @State private var address2 = String()

    @State private var experience = String()
    @State private var note = String()

    @State private var showingValidation = false

    private var validInput: Bool {
        return !(firstName.isEmpty || lastName.isEmpty || email.isEmpty || address1.isEmpty || address2.isEmpty)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            Button("cancel") {
                dismiss()
            }
            .foregroundStyle(Color.accent)

            Text("New teacher")
                .font(.title)

            VStack(alignment: .leading, spacing: 20) {
                TextFieldV("First name", text: $firstName, showingValidation: showingValidation)
                TextFieldV("Last name", text: $lastName, showingValidation: showingValidation)
                TextFieldV("Email", text: $email, showingValidation: showingValidation)
                TextFieldV("Phone", text: $phone, showingValidation: showingValidation)
                TextFieldV("Address 1", text: $address1, showingValidation: showingValidation)
                TextFieldV("Address 2", text: $address2, showingValidation: showingValidation)
            }
            VStack(alignment: .leading, spacing: 20) {
                TextField("Experience", text: $experience)
                TextField("Note", text: $note)
            }
            .textFieldStyle(Custom())

            Button {
                if validInput {
                    let newTeacher = Teacher(firstName: firstName, lastName: lastName, email: email, phone: phone, address1: address1, address2: address2, experience: experience, note: note)
                    modelContext.insert(newTeacher)
                    dismiss()
                } else {
                    showingValidation = true
                }
            } label: {
                Text("Create")
                    .frame(width: 300)
                    .padding(.vertical, 3)
            }
            .buttonStyle(Primary())
            .disabled(!validInput)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .textFieldStyle(.roundedBorder)
        .padding(20)
    }
}

#Preview {
    CreateTeacherView()
}

