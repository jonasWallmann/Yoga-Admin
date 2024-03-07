//
//  ViewModel.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 18.02.24.
//

import Foundation

@Observable
class AppVM {
    public var group: CourseGroup?

    init(group: CourseGroup? = nil) {
        self.group = group
    }
}
