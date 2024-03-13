//
//  CheckBox.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 23.02.24.
//

import SwiftUI

struct CheckBox: View {
    var label: String? = nil
    var addition: String? = nil

    @Binding var isSelected: Bool

    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            HStack {
                checkmark

                if let label = label {
                    Text(label)
                }

                if let addition = addition {
                    Spacer()
                    Text(addition)
                }
            }
            .foregroundStyle(.dark)
        }
        .buttonStyle(.plain)
    }

    private var checkmark: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .foregroundStyle(isSelected ? .accent : .snow)

            RoundedRectangle(cornerRadius: 2)
                .strokeBorder(lineWidth: 1.6)

            if isSelected {
                Image(systemName: "checkmark")
                    .font(.system(size: 9, weight: .bold))
                    .foregroundStyle(Color.white)
            }
        }
        .frame(width: 14, height: 14)
        .foregroundStyle(Color.accent)
    }
}

#Preview {
    @State var isSelected = false

    return CheckBox(isSelected: $isSelected)
        .padding()
}
