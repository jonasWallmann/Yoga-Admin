//
//  StudentPersonalInformationView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 23.02.24.
//

import SwiftUI

enum PersonalInformationEnum {
    case firstName
    case lastName
    case email
    case phone
    case address1
    case address2
    case note
}

struct StudentPersonalInformationView: View {
    let student: Student

    @State private var firstNameInput = String()
    @State private var lastNameInput = String()
    @State private var emailInput = String()
    @State private var phoneInput = String()
    @State private var address1Input = String()
    @State private var address2Input = String()
    @State private var noteInput = String()

    @State private var validationError: PersonalInformationEnum?

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Information")
                .font(.headline)
            Divider()

            TextFieldV("First name", text: $firstNameInput, showingValidation: validationError == .firstName, showTitle: true)
                .onSubmit {
                    if firstNameInput.isEmpty {
                        validationError = .firstName
                    } else {
                        student.firstName = firstNameInput
                        validationError = nil
                    }
                }

            TextFieldV("Last name", text: $lastNameInput, showingValidation: validationError == .lastName, showTitle: true)
                .onSubmit {
                    if lastNameInput.isEmpty {
                        validationError = .lastName
                    } else {
                        student.lastName = lastNameInput
                        validationError = nil
                    }
                }

            TextFieldV("Email", text: $emailInput, showingValidation: validationError == .email, showTitle: true)
                .onSubmit {
                    if emailInput.isEmpty {
                        validationError = .email
                    } else {
                        student.email = emailInput
                        validationError = nil
                    }
                }

            TextFieldV("Phone", text: $phoneInput, showingValidation: validationError == .phone, showTitle: true)
                .onSubmit {
                    if phoneInput.isEmpty {
                        validationError = .phone
                    } else {
                        student.phone = phoneInput
                        validationError = nil
                    }
                }

            TextFieldV("Address 1", text: $address1Input, showingValidation: validationError == .address1, showTitle: true)
                .onSubmit {
                    if address1Input.isEmpty {
                        validationError = .address1
                    } else {
                        student.address1 = address1Input
                        validationError = nil
                    }
                }

            TextFieldV("Address 2", text: $address2Input, showingValidation: validationError == .address2, showTitle: true)
                .onSubmit {
                    if address2Input.isEmpty {
                        validationError = .address2
                    } else {
                        student.address2 = address2Input
                        validationError = nil
                    }
                }
        }
        .onAppear {
            setStudentInformation(for: student)
        }
        .onChange(of: student) { _, newValue in
            setStudentInformation(for: newValue)
        }
    }

    private func setStudentInformation(for student: Student) {
        firstNameInput = student.firstName
        lastNameInput = student.lastName
        emailInput = student.email
        phoneInput = student.phone
        address1Input = student.address1
        address2Input = student.address2
        noteInput = student.note
    }
}

#Preview {
    let data = PreviewHelper.data

    return StudentPersonalInformationView(student: data.student)
        .frame(maxWidth: 440, minHeight: 600)
}
