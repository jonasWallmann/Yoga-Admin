//
//  TextFieldStyle.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 05.03.24.
//

import SwiftUI

struct Custom: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .textFieldStyle(.plain)
            .padding(8)
            .overlay {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(.medium.opacity(0.5), lineWidth: 1)
            }
            .foregroundStyle(.dark)
    }
}

#Preview {
    @State var input = String()

    return TextField("type something...", text: $input)
        .textFieldStyle(Custom())
        .padding()
        .background(Color.snow)
}
