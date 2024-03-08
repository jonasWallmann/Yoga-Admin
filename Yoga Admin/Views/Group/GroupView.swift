//
//  GroupView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 18.02.24.
//

import SwiftData
import SwiftUI

struct GroupView: View {
    @Query(sort: \CourseGroup.number, order: .reverse) private var groups: [CourseGroup]

    @Binding var selection: CourseGroup?

    var body: some View {
        VStack(alignment: .leading) {            
            HStack(alignment: .top, spacing: 32) {
                if !groups.isEmpty {
                    GroupSelectionView(groups: groups, selection: $selection)
                        .section(horizontallyExtended: false)
                }

                CreateGroupFormView()
                    .section(horizontallyExtended: false)
            }
        }
        .screen()
    }
}

#Preview {
    GroupView(selection: .constant(nil))
        .modelContainer(for: CourseGroup.self)
        .environment(AppVM())
}
