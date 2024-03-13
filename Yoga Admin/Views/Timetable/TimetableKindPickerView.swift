//
//  CardBodyPickerView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 21.02.24.
//

import SwiftUI

struct TimetableKindPickerView: View { 
    @Binding var selection: TableKind

    var body: some View {
        HStack(spacing: 20) {
            ForEach(TableKind.allCases, id: \.self) { kind in
                Button {
                    selection = kind
                } label: {
                    Text(kind.rawValue)
                        .frame(minWidth: 100)
                        .padding(10)
                        .if(kind == selection, transform: { view in
                            view
                                .background(Color.accent)
                                .foregroundStyle(.white)
                                .clipShape(Capsule())
                        })
                }
                .buttonStyle(.plain)
            }
        }
        .padding(5)
        .background(Color.snow)
        .clipShape(Capsule())
    }
}

#Preview {
    @State var kind: TableKind = .information

    return TimetableKindPickerView(selection: $kind)
}
