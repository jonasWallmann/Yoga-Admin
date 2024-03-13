//
//  AttendanceVM.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 07.03.24.
//

import Foundation

@Observable
class CourseSelectionsVM {
    private(set) var courses: [Course]
    private(set) var selectedCourses = [Course]()

    public let selectionCallback: ([Course]) -> Void

    init(courses: [Course], selectedCourses: [Course] = [], selectionCallback: @escaping ([Course]) -> Void) {
        self.courses = courses
        self.selectedCourses = selectedCourses
        self.selectionCallback = selectionCallback
    }

    public func courses(_ courses: [Course] = [], areIncluded: Bool) {
        if areIncluded {
            let timeSorted = courses.sorted { left, right in
                let leftHour = Calendar.hour(from: left.start)
                let rightHour = Calendar.hour(from: right.start)

                return leftHour < rightHour
            }
            selectedCourses = timeSorted.sorted(by: { left, right in
                let leftDay = Calendar.weekday(from: left.start)
                let rightDay = Calendar.weekday(from: right.start)

                return leftDay < rightDay
            })
        } else {
            selectedCourses = []
        }
    }

    public func course(_ course: Course, isIncluded: Bool) {
        if isIncluded {
            if selectedCourses.contains(course) { return }

            selectedCourses.insert(course, at: 0)
        } else {
            selectedCourses.removeAll(where: { $0 == course })
        }
    }
}
