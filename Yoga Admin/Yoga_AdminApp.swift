//
//  Yoga_AdminApp.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 07.03.24.
//

import SwiftUI
import SwiftData

@main
struct Yoga_AdminApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            CourseGroup.self, Teacher.self, Course.self, Student.self, Registration.self,
        ])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer)
        }
    }
}
