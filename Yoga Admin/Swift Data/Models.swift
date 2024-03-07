//
//  Item.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 16.02.24.
//

import Foundation
import SwiftData

@Model
final class CourseGroup {
    var name: String
    var number: Double

    @Relationship(inverse: \Course.group) var courses: [Course]?

    init(name: String, number: Double) {
        self.name = name
        self.number = number
    }   
}

@Model
final class Teacher {
    let firstName: String
    let lastName: String
    let email: String
    let phone: String
    let address1: String
    let address2: String

    let experience: String
    let note: String

    @Relationship(inverse: \Course.teacher) var courses: [Course]?

    init(firstName: String, lastName: String, email: String, phone: String, address1: String, address2: String, experience: String, note: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.address1 = address1
        self.address2 = address2
        self.experience = experience
        self.note = note
    }
}

@Model
final class Course {
    let name: String
    let color: ColorEnum
    let start: Date
    let end: Date
    let price: Double
    let kind: CourseKind
    let level: String?

    var teacher: Teacher?
    var group: CourseGroup?

    @Relationship(inverse: \Registration.course) var registrations: [Registration]?

    init(name: String, color: ColorEnum, start: Date, end: Date, price: Double, kind: CourseKind, level: String? = nil, teacher: Teacher, group: CourseGroup) {
        self.name = name
        self.color = color
        self.start = start
        self.end = end
        self.price = price
        self.kind = kind
        self.level = level
        self.teacher = teacher
        self.group = group
    }
}

@Model
final class Student {
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    var address1: String
    var address2: String
    var note: String

    @Relationship(inverse: \Registration.student) var registrations: [Registration]?

    init(firstName: String, lastName: String, email: String, phone: String, address1: String, address2: String, note: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.address1 = address1
        self.address2 = address2
        self.note = note
    }
}

@Model
final class Registration {
    let timestamp: Date

    var paid: Bool
    var note: String

    var student: Student?
    var course: Course?

    init(note: String, student: Student, course: Course, paid: Bool = false) {
        self.timestamp = .now
        self.paid = paid
        self.note = note

        self.student = student
        self.course = course
    }
}
