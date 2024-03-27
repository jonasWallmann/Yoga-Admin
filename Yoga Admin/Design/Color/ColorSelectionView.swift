//
//  ColorSelectionView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftData
import SwiftUI

struct ColorSelectionView: View {
    @Binding var selectedColor: ColorEnum?

    @Query private var courses: [Course]

    var body: some View {
        HStack(alignment: .top, spacing: 52) {
            VStack(alignment: .leading, spacing: 16) {
                colorOption(for: .red)
                colorOption(for: .orange)
                colorOption(for: .yellow)
                colorOption(for: .green)
            }

            VStack(alignment: .leading, spacing: 16) {
                colorOption(for: .teal)
                colorOption(for: .blue)
                colorOption(for: .purple)
                colorOption(for: .brown)
            }
        }
    }

    private func colorOption(for color: ColorEnum) -> some View {
        Button {
            selectedColor = color
        } label: {
            HStack(spacing: 12) {
                ColorOptionView(color: color, selectedColor: $selectedColor)
                Text(colorLabel(for: color) ?? "-")
                    .foregroundStyle(.dark)
            }
        }
        .buttonStyle(.plain)
    }

    private func colorLabel(for color: ColorEnum) -> String? {
        let course = courses.first(where: { $0.color == color })
        return course?.name
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 1500)) {
    let content = PreviewHelper.content

    return ColorSelectionView(selectedColor: .constant(.blue))
        .modelContainer(content.container)
        .padding(40)
}
