//
//  ColorOptionView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftUI

struct ColorOptionView: View {
    @Environment(\.colorScheme) private var colorScheme

    let color: ColorEnum

    @Binding var selectedColor: ColorEnum?

    var isPale: Bool = false

    private var previewColor: Color {
        isPale ? Color.paleFor(color: color, scheme: colorScheme) : color.value
    }

    var body: some View {
        ZStack {
            if color == selectedColor {
                Circle()
                    .frame(width: 20)

                Circle()
                    .stroke(lineWidth: 3)
                    .frame(width: 28)

//                        Circle()
//                            .frame(width: 8)
//                            .offset(y: 26)
            } else {
                Circle()
                    .frame(width: 28)
            }
        }
        .foregroundStyle(previewColor)
    }
}

#Preview {
    HStack {
        ColorOptionView(color: .blue, selectedColor: .constant(.blue), isPale: false)
        ColorOptionView(color: .red, selectedColor: .constant(.blue), isPale: false)
    }
    .padding(100)
}
