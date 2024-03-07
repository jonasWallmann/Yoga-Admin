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

    let isSelected: Bool

    let selectionCallback: () -> Void

    var body: some View {
        Button(action: selectionCallback) {
            HStack {
                checkmark

                if let label = label {
                    Text(label)
                        .foregroundStyle(addition == nil ? Color.dark : Color.darkest)
                        .fontWeight(addition == nil ? .regular : .medium)
                }

                if let addition = addition {
                    Text(addition)
                        .foregroundStyle(Color.dark)
                }
            }
        }
        .buttonStyle(.plain)
    }

    private var checkmark: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .foregroundStyle(isSelected ? .accent : .snow)

            RoundedRectangle(cornerRadius: 2)
                .stroke(lineWidth: 1.6)

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

    return CheckBox(isSelected: isSelected) {
        isSelected.toggle()
    }
    .padding()
}
