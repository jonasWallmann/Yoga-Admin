//
//  ExistingCoursesView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 13.03.24.
//

import SwiftData
import SwiftUI

private let ARROW_SPACE: CGFloat = 52

struct ExistingCoursesView: View {
    @Environment(AppVM.self) private var appVM

    @Query private var groups: [CourseGroup]

    @Bindable public var vm: CourseVM

    private var previousGroup: CourseGroup? {
        guard let previousNumber = appVM.group?.number else { return nil }

        return groups.first(where: { $0.number == previousNumber - 1 })
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                HStack(spacing: 8) {
                    if let lastGroup = previousGroup {
                        Text(lastGroup.name)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    arrowSpace
                    Text(appVM.group?.name ?? "no group")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.title3)
                .foregroundStyle(.darkest)

                ForEach(0 ..< 7) { dayIndex in
                    let pairs: [CoursePair] = getCoursePairs(on: dayIndex)

                    if pairs.isEmpty == false {
                        VStack(alignment: .leading, spacing: 12) {
                            Text(Calendar.dayNames[dayIndex].uppercased())
                                .tagLine()

                            ForEach(pairs) { pair in
                                HStack(spacing: 8) {
                                    if let previousCourse = pair.previous {
                                        courseDescription(course: previousCourse)
                                            .frame(maxWidth: .infinity, alignment: .leading)

                                        if pair.current == nil {
                                            Button {
                                                vm.useTemplate(course: previousCourse)
                                            } label: {
                                                Image(systemName: "arrow.right.circle")
                                                    .foregroundStyle(previousCourse.color.value)
                                            }
                                            .buttonStyle(.plain)
                                            .frame(width: ARROW_SPACE)
                                        } else {
                                            arrowSpace
                                        }
                                    } else {
                                        arrowSpace
                                        space
                                    }

                                    if let currentCourse = pair.current {
                                        courseDescription(course: currentCourse)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    } else {
                                        space
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(.top, 24)
        }
    }

    private func getCoursePairs(on dayIndex: Int) -> [CoursePair] {
        var previousCourses = Course.onDay(dayIndex, courses: previousGroup?.courses)
        var currentCourses = Course.onDay(dayIndex, courses: appVM.courses)

        var pairs = [CoursePair]()

        while true {
            guard
                let previous = previousCourses.first,
                let current = currentCourses.first
            else { break }

            let previousHour = Calendar.hour(from: previous.start)
            let currentHour = Calendar.hour(from: current.start)

            if previousHour < currentHour {
                pairs.append(CoursePair(previous: previous, current: nil))
                previousCourses.removeFirst()
            } else if previousHour == currentHour {
                pairs.append(CoursePair(previous: previous, current: current))
                previousCourses.removeFirst()
                currentCourses.removeFirst()
            } else {
                pairs.append(CoursePair(previous: nil, current: current))
                currentCourses.removeFirst()
            }
        }
        pairs.append(contentsOf: previousCourses.map { CoursePair(previous: $0, current: nil) })
        pairs.append(contentsOf: currentCourses.map { CoursePair(previous: nil, current: $0) })

        return pairs
    }

    private func courseDescription(course: Course) -> some View {
        HStack(spacing: 4) {
            Text(course.name)
                .foregroundStyle(.dark)
                .lineLimit(1)
            Text(course.time)
                .foregroundStyle(.medium)
        }
    }

    private var space: some View {
        Spacer()
            .frame(maxWidth: .infinity)
    }

    private var arrowSpace: some View {
        Spacer()
            .frame(width: ARROW_SPACE)
    }
}

struct CoursePair: Identifiable {
    let id = UUID()

    let previous: Course?
    let current: Course?
}

#Preview(traits: traits) {
    let content = PreviewHelper.content

    return ExistingCoursesView(vm: CourseVM())
        .environment(content.appVM)
        .modelContainer(content.container)
        .padding(20)
        .background(.snow)
        .frame(maxWidth: 400)
}
