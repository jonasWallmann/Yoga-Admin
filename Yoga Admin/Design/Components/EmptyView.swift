//
//  EmptyView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 24.02.24.
//

import SwiftUI

struct EmptyView: View {
    let label: String
    let subLabel: String?
    let systemImage: String

    init(label: String, subLabel: String? = nil, systemImage: String) {
        self.label = label
        self.subLabel = subLabel
        self.systemImage = systemImage
    }

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: systemImage)
                .font(.system(size: 50))
                .foregroundStyle(Color.accent)

            VStack(spacing: 8) {
                Text(label)
                    .font(.title)
                    .fontWeight(.medium)

                if let subLabel = subLabel {
                    Text(subLabel)
                }
            }
            .foregroundStyle(Color.dark)
        }
        .padding(.bottom, 80)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.lightest)
    }
}

#Preview {
    EmptyView(label: "SwiftData", subLabel: "No data in context", systemImage: "swiftdata")
}
