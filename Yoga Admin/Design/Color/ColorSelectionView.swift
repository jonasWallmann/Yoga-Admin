//
//  ColorSelectionView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftUI

struct ColorSelectionView: View {
    @Binding var selectedColor: ColorEnum?

    var isPale: Bool = false

    var body: some View {
        HStack(spacing: 15) {
            ForEach(ColorEnum.allCases) { option in
                ColorOptionView(color: option, selectedColor: $selectedColor, isPale: isPale)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    ColorSelectionView(selectedColor: .constant(.blue))
        .padding(40)
}

