//
//  CourseGroupSelectionView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftData
import SwiftUI

struct GroupSelectionView: View {
    var groups: [CourseGroup]

    @Binding var selection: CourseGroup?

    private var index: Int? {
        guard let selection = selection else { return nil }

        return groups.firstIndex(of: selection)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Selection")
                .bold()
            
            ForEach(groups) { group in
                Button {
                    selection = group
                } label: {
                    DotOption(label: group.name, isSelected: selection == group) {
                        selection = group
                    }
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    @State var selection: CourseGroup?

    let groups = [
        CourseGroup(name: "2024 Q1", number: 1),
        CourseGroup(name: "2024 Q2", number: 2)
    ]

    return GroupSelectionView(groups: groups, selection: $selection)
        .padding()
}
