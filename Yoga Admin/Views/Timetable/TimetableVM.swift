//
//  TimetableVM.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 20.02.24.
//

import Foundation

@Observable
class TimetableVM {
    public var kind: TableKind = .information

    public var days = [[Course?]]()
    public var timeRows = [[Course?]]()

    public func create(for courses: [Course]) {
        days = [[]]
        timeRows = [[]]

        let sorted = sortedCourses(courses)
        createDays(for: sorted)
        alignTimes()
        createTimeRows()
    }

    // MARK: Day lists ----------------------------------------------------

    private func sortedCourses(_ courses: [Course]) -> [Course] {
        var courses = courses
        courses.sort { left, right in
            Calendar.weekday(from: left.start) < Calendar.weekday(from: right.start)
        }
        courses.sort { left, right in
            Calendar.hour(from: left.start) < Calendar.hour(from: right.start)
        }
        return courses
    }

    private func createDays(for courses: [Course]) {
        for course in courses {
            let dayNumber = Calendar.weekday(from: course.start)

            while dayNumber >= days.count {
                days.append([])
            }
            days[dayNumber].append(course)
        }
    }

    private func alignTimes() {
        for timeRow in 0 ..< 10 {
            guard let earliestHour = earliestHour(timeRow) else { return }

            for (index, day) in days.enumerated() {
                if timeRow >= day.count { continue }

                guard let course = day[timeRow] else { continue }

                if Calendar.hour(from: course.start) > earliestHour + 1 {
                    days[index].insert(nil, at: timeRow)
                }
            }
        }
    }

    private func earliestHour(_ timeRow: Int) -> Int? {
        var earliest: Int?

        for day in days {
            if timeRow >= day.count { continue }

            guard let course = day[timeRow] else { continue }
            let hour = Calendar.hour(from: course.start)

            if hour < earliest ?? 25 {
                earliest = hour
            }
        }
        return earliest
    }

    // MARK: Time row lists --------------------------------------------------

    private func createTimeRows() {
        for hourRow in 0 ..< 10 {
            timeRows.append([])

            var courseOnHourRow = false
            for day in days {
                if hourRow < day.count {
                    courseOnHourRow = true
                }
            }
            if !courseOnHourRow {
                return 
            }

            for day in days {
                let course = hourRow >= day.count ? nil : day[hourRow]
                timeRows[hourRow].append(course)
            }
        }
    }
}
