//
//  CourseVM.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftUI
import SwiftData

@Observable
class CourseVM {
    public var name = String()
    public var color: ColorEnum?

    public var startDate: Date = .now
    public var endDate: Date = .now

    public var startTime: Date = .now
    public var endTime: Date = .now + 3600

    public var price: Double?
    public var kind: CourseKind? = .regular
    public var teacher: Teacher?

    public var showingCreateTeacherSheet = false
    public var showingValidation = false

    public var validInput: Bool {
        !(name.isEmpty || color == nil || price == nil || kind == nil || teacher == nil)
    }

    public func createCourse(modelContext: ModelContext, group: CourseGroup?) {
        if validInput {
            guard let color = color, let price = price, let kind = kind, let teacher = teacher, let group = group else {
                fatalError("input validation failed")
            }

            guard
                let contextTeacher = modelContext.model(for: teacher.id) as? Teacher,
                let contextGroup = modelContext.model(for: group.id) as? CourseGroup
            else {
                fatalError("Context")
            }

            guard
                let start = dateTime(date: startDate, time: startTime),
                let end = dateTime(date: endDate, time: endTime)
            else {
                fatalError("Composing start & end date")
            }

            let newCourse = Course(name: name, color: color, start: start, end: end, price: price, kind: kind, teacher: contextTeacher, group: contextGroup)

            withAnimation {
                modelContext.insert(newCourse)
            }

            resetInputs()
        } else {
            showingValidation = true
        }
    }

    private func dateTime(date: Date, time: Date) -> Date? {
        var components = DateComponents()
        components.day = Calendar.current.component(.day, from: date)
        components.month = Calendar.current.component(.month, from: date)
        components.year = Calendar.current.component(.year, from: date)
        components.hour = Calendar.current.component(.hour, from: time)
        components.minute = Calendar.current.component(.minute, from: time)

        return Calendar.current.date(from: components)
    }

    private func resetInputs() {
        name = String()
        color = nil
        startDate = .now
        endDate = .now
        startTime = .now
        endTime = .now + 3600
        price = nil
        teacher = nil
    }

    public func useTemplate(course: Course) {
        let isEmpty = name.isEmpty

        if isEmpty == false {
            resetInputs()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + (isEmpty ? 0 : 0.3)) {
            self.name = course.name
            self.color = course.color

            self.startDate = course.end.addingTimeInterval(3600 * 24 * 7)
            self.endDate = course.end.addingTimeInterval(3600 * 24 * 7 * Double(course.lessonCount))

            self.startTime = course.start
            self.endTime = course.end

            self.price = course.price
            self.kind = course.kind
            self.teacher = course.teacher
        }
    }

    public func autoSelectColor(for name: String, courses: [Course]) {
        if name.isEmpty {
            color = nil
            return
        }
        
        if let matchingCourse = courses.first(where: { $0.name.prefix(name.count) == name }) {
            color = matchingCourse.color
        } else {
            for colorOption in ColorEnum.allCases {
                if courses.contains(where: { $0.color == colorOption }) == false {
                    color = colorOption
                    return
                }
            }
        }
    }
}
