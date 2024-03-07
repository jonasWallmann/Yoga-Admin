//
//  ContentView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 16.02.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var appVM = AppVM()

    @Query private var groups: [CourseGroup]

    var body: some View {
        NavigationSplitView {
            List {
                Section("GROUP") {
                    NavigationLink {
                        GroupView(selection: $appVM.group)
                            .environment(appVM)
                    } label: {
                        Label(appVM.group?.name ?? "New", systemImage: "tray.2")
                    }
                }

                Section("CREATE") {
                    NavigationLink {
                        RegistrationView()
                            .environment(appVM)
                    } label: {
                        Label("Registration", systemImage: "person")
                    }

                    NavigationLink {
                        CourseView()
                            .environment(appVM)
                    } label: {
                        Label("Course", systemImage: "list.bullet.clipboard")
                    }

                    NavigationLink {
                        PaymentView()
                    } label: {
                        Label("Payment", systemImage: "banknote")
                    }
                }

                Section("LOOKUP") {
                    NavigationLink {
                        StudentsView()
                            .environment(appVM)
                    } label: {
                        Label("Students", systemImage: "person.2")
                    }

                    NavigationLink {
                        TimetableView()
                            .environment(appVM)
                    } label: {
                        Label("Timetable", systemImage: "table")
                    }
                    NavigationLink {
                        FinanceView()
                            .environment(appVM)
                    } label: {
                        Label("Finance", systemImage: "chart.bar")
                    }
                }

                Section("PRINTS") {
                    NavigationLink {
                        AttendanceView()
                            .environment(appVM)
                            .navigationTitle("Attendance")
                    } label: {
                        Label("Attendance", systemImage: "checkmark.circle")
                    }

                }
            }
            .listStyle(.sidebar)
            .onAppear {
                appVM.group = groups.last
            }
            #if os(macOS)
            .padding(.top)
            #endif

        } detail: {
            VStack(spacing: 100) {
                VStack(spacing: 28) {
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3.5)
                        Image(systemName: "figure.yoga")
                            .font(.system(size: 32))
                    }
                    .foregroundStyle(Color.accent)
                    .frame(width: 84)

                    Text("Welcome")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.dark)
                }

                DebugView(appVM: appVM)
            }
        }
    }
}

#Preview(traits: traits) {
    let content = PreviewHelper.content

    return ContentView()
        .modelContainer(content.container)
}
