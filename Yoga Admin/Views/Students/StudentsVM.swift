//
//  StudentsVM.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 09.03.24.
//

import Foundation

@Observable
class StudentsVM {
    public var query = String()

    public var student: Student?

    public var registrations: [Registration]? {
        guard let registrations = student?.registrations else { return nil }

        return registrations.isEmpty ? nil : registrations
    }

    public func searchResults(in students: [Student]) -> [Student] {
        if query.isEmpty {
            return students
        } else {
            let matchingStudents = students.filter { $0.name.localizedStandardContains(query) }

            return matchingStudents.sorted { left, right in
                var offLeft = 0
                var offRight = 0

                for charIndex in 0 ..< query.count {
                    let searchChar = query.index(query.startIndex, offsetBy: charIndex)
                    let leftChar = left.name.index(left.name.startIndex, offsetBy: charIndex)
                    let rightChar = right.name.index(right.name.startIndex, offsetBy: charIndex)

                    offLeft += leftChar == searchChar ? 0 : 1
                    offRight += rightChar == searchChar ? 0 : 1

                }
                return offLeft < offRight
            }
        }
    }

}
