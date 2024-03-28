//
//  RegistrationVM.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftData
import SwiftUI

@Observable
class RegistrationVM {
    public var firstName = String()
    public var lastName = String()
    public var email = String()
    public var phone = String()
    public var address1 = String()
    public var address2 = String()
    public var note = String()

    private(set) var suggestedStudent: Student?

    public var course: Course?

    private(set) var showingValidationError = false

    public var validInputs: Bool {
        !(firstName.isEmpty || lastName.isEmpty || email.isEmpty || course == nil)
    }

    // MARK: Suggestions -------------------------------------------------

    public func checkSuggestion(newFirstName: String? = nil, newLastName: String? = nil, newEmail: String? = nil, from students: [Student]) {
        let firstName = newFirstName ?? firstName
        let lastName = newLastName ?? lastName
        let email = newEmail ?? email

        let matchingStudents = students.filter { student in
            let matchingFirstName = student.firstName.localizedStandardContains(firstName)
            let matchingLastName = lastName.isEmpty || student.lastName.localizedStandardContains(lastName)
            let matchingEmail = email.isEmpty || student.email.localizedStandardContains(email)

            return matchingFirstName && matchingLastName && matchingEmail
        }

        for student in matchingStudents {
            if student.firstName.prefix(firstName.count) == firstName {
                suggestedStudent = student
                return
            }
        }
        suggestedStudent = matchingStudents.first
    }

    public func fillOutForSuggestedStudent() {
        guard let suggestedStudent = suggestedStudent else { return }

        firstName = suggestedStudent.firstName
        lastName = suggestedStudent.lastName
        email = suggestedStudent.email
        phone = suggestedStudent.phone
        address1 = suggestedStudent.address1
        address2 = suggestedStudent.address2
        note = suggestedStudent.note

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            withAnimation {
                self.suggestedStudent = nil
            }
        }
    }

    // MARK: Save ----------------------------------------------------------------

    public func save(modelContext: ModelContext, students: [Student], registrations: [Registration]) {
        if validInputs == false {
            withAnimation {
                showingValidationError = true
            }
            return
        }
        showingValidationError = false

        let student = getStudent(modelContext: modelContext, students: students)

        if !registrations.contains(where: { $0.student == student && $0.course == course }) {
            createRegistration(student: student, modelContext: modelContext)
        }
        resetInputs()
    }

    private func getStudent(modelContext: ModelContext, students: [Student]) -> Student {
        if let student = students.first(where: { $0.email == email }) {
            return student
        }
        let newStudent = Student(firstName: firstName, lastName: lastName, email: email, phone: phone, address1: address1, address2: address2, note: note)
        modelContext.insert(newStudent)
        return newStudent
    }

    private func createRegistration(student: Student, modelContext: ModelContext) {
        guard
            let course = course,
            let contextStudent = modelContext.model(for: student.id) as? Student,
            let contextCourse = modelContext.model(for: course.id) as? Course
        else { return }

        let newRegistration = Registration(note: note, student: contextStudent, course: contextCourse)
        modelContext.insert(newRegistration)
    }

    private func resetInputs() {
        firstName = String()
        lastName = String()
        email = String()
        phone = String()
        address1 = String()
        phone = String()
        address1 = String()
        address2 = String()
        note = String()
        course = nil
    }
}
