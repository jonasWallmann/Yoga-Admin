//
//  SearchField.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 24.02.24.
//

import SwiftUI

struct SearchField: View {
    let label: String

    @Binding var value: String

    init(_ label: String, value: Binding<String>) {
        self.label = label
        self._value = value
    }

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.medium)
            TextField(label, text: $value)
                .focusEffectDisabled()
                .textFieldStyle(.plain)
        }
        .padding(8)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
                .foregroundStyle(Color.medium)
        }
    }
}

#Preview {
    @State var searchText = String()

    return SearchField("name...", value: $searchText)
}
