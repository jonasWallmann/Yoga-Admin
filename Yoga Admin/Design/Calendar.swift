//
//  Calendar.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 20.02.24.
//

import Foundation

extension Calendar {
    public static var dayNames: [String] {
        ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    }

    public static func weekday(from date: Date) -> Int {
        let day = Calendar.current.component(.weekday, from: date)

        if day > 1 {
            return day - 2
        }
        return 6
    }

    public static func hour(from date: Date) -> Int {
        return Calendar.current.component(.hour, from: date)
    }

    public static func date(day: Int, month: Int, year: Int) -> Date {
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year
        return Calendar.current.date(from: components)!
    }

    public static func time(hour: Int, minute: Int, second: Int = 0) -> Date {
        var components = DateComponents()
        components.hour = hour
        components.minute = minute
        components.second = second
        return Calendar.current.date(from: components)!
    }

    public static func dateTime(day: Int, month: Int, year: Int, hour: Int, minute: Int , second: Int = 0) -> Date {
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year
        components.hour = hour
        components.minute = minute
        components.second = second
        return Calendar.current.date(from: components)!
    }
}
