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
                            .navigationTitle("Group")
                    } label: {
                        Label(appVM.group?.name ?? "New", systemImage: "tray.2")
                    }
                }

                Section("CREATE") {
                    NavigationLink {
                        RegistrationView()
                            .environment(appVM)
                            .navigationTitle("Registration")
                    } label: {
                        Label("Registration", systemImage: "person")
                    }

                    NavigationLink {
                        CourseView()
                            .environment(appVM)
                            .navigationTitle("Course")
                    } label: {
                        Label("Course", systemImage: "list.bullet.clipboard")
                    }

                    NavigationLink {
                        PaymentView()
                            .navigationTitle("Payment")
                    } label: {
                        Label("Payment", systemImage: "banknote")
                    }
                }

                Section("LOOKUP") {
                    NavigationLink {
                        StudentsView()
                            .environment(appVM)
                            .navigationTitle("Students")
                    } label: {
                        Label("Students", systemImage: "person.2")
                    }

                    NavigationLink {
                        TimetableView()
                            .environment(appVM)
                            .navigationTitle("Timetable")
                    } label: {
                        Label("Timetable", systemImage: "table")
                    }

                    NavigationLink {
                        ListView()
                            .environment(appVM)
                            .navigationTitle("Course lists")
                    } label: {
                        Label("Course lists", systemImage: "list.bullet.rectangle.portrait")
                    }

//                    NavigationLink {
//                        FinanceView()
//                            .environment(appVM)
//                            .navigationTitle("Finance")
//                    } label: {
//                        Label("Finance", systemImage: "chart.bar")
//                    }
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
