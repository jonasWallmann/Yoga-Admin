//
//  KindPickerView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 19.02.24.
//

import SwiftUI

struct KindPickerView: View {
    @Binding var kind: CourseKind?

    var body: some View {
        HStack {
            Text("Kind")
                .bold()
            Spacer()
            Picker("kind", selection: $kind) {
                Text("select").tag(nil as CourseKind?)
                Divider()

                ForEach(CourseKind.allCases, id: \.rawValue) { kind in
                    Text(kind.rawValue).tag(kind as CourseKind?)
                }
            }
            .tint(Color.accent)
        }
        .frame(maxWidth: 220)
    }
}

#Preview {
    @State var kind: CourseKind?

    return KindPickerView(kind: $kind)
}
