//
//  ModelExtensions.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 06.03.24.
//

import Foundation

enum CourseKind: String, Codable, CaseIterable {
    case regular = "Regular"
    case special = "Special"
}

extension Course {
    public var day: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"

        return formatter.string(from: start)
    }

    public var dayLong: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"

        return formatter.string(from: start)
    }

    public var dates: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM."

        return "\(formatter.string(from: start)) - \(formatter.string(from: end))"
    }

    public var time: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"

        return formatter.string(from: start)
    }

    public var times: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"

        return "\(formatter.string(from: start)) - \(formatter.string(from: end))"
    }

    public var lessonCount: Int {
        (Calendar.current.dateComponents([.day], from: start, to: end).day ?? 0) / 7 + 1
    }

    public var registrationCount: Int {
        registrations?.count ?? 0
    }

    public var startsInDays: Int {
        return Int(start.timeIntervalSince(.now) / 3600 / 24)
    }

    static public func onDay(_ day: Int, courses: [Course]?) -> [Course] {
        guard let courses = courses else { return [] }

        return courses.filter { course in
            Calendar.weekday(from: course.start) == day
        }
        .sorted(by: { Calendar.hour(from: $0.start) < Calendar.hour(from: $1.start) })
    }
}

extension Student {
    public var name: String {
        "\(firstName) \(lastName)"
    }
}
