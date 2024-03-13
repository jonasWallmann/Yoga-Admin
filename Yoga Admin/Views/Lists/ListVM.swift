//
//  ListVM.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 08.03.24.
//

import SwiftUI

@Observable
class ListVM {
    public var kind: ListKindEnum = .attendance
    public var courses = [Course]()

    public func newCouseSelection(_ newCourses: [Course]) {
        withAnimation(.easeOut(duration: 0.7)) {
            courses = newCourses
        }
    }

    public func print() {
        
    }
}

enum ListKindEnum: String, CaseIterable {
    case attendance = "Attendance"
    case reRegistration = "Re-registration"
}
