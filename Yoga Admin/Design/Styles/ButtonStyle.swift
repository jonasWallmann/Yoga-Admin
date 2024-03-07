//
//  ButtonStyle.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 05.03.24.
//

import SwiftUI

private let VERTICAL_PADDING: CGFloat = 8
private let HORIZONTAL_PADDING: CGFloat = 16

struct Primary: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, VERTICAL_PADDING)
            .padding(.horizontal, HORIZONTAL_PADDING)
            .foregroundStyle(.white)
            .background(isEnabled ? .accent : .disabled, in: RoundedRectangle(cornerRadius: 8))
            .opacity(configuration.isPressed ? 0.5 : 1)
            .fontWeight(.medium)
    }
}

struct Secondary: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, VERTICAL_PADDING)
            .padding(.horizontal, HORIZONTAL_PADDING)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1))
            .foregroundStyle(isEnabled ? .accent : .disabled)
            .opacity(configuration.isPressed ? 0.5 : 1)
            .fontWeight(.medium)
    }
}

struct Tertiary: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, VERTICAL_PADDING)
            .underline()
            .foregroundStyle(isEnabled ? .accent : .disabled)
            .opacity(configuration.isPressed ? 0.5 : 1)
            .fontWeight(.medium)
    }
}


#Preview {
    VStack(spacing: 40) {
        HStack {
            Button("Primary", action: {})
                .buttonStyle(Primary())

            Button("Primary", action: {})
                .buttonStyle(Primary())
                .disabled(true)
        }
        HStack {
            Button("Secondary", action: {})
                .buttonStyle(Secondary())

            Button("Secondary", action: {})
                .buttonStyle(Secondary())
                .disabled(true)
        }

        HStack {
            Button("Tertiary", action: {})
                .buttonStyle(Tertiary())

            Button("Tertiary", action: {})
                .buttonStyle(Tertiary())
                .disabled(true)
        }
    }
    .padding(52)
    .background(Color.snow)
}
