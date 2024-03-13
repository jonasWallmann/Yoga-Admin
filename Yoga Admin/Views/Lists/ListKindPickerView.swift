//
//  ListKindPickerView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 08.03.24.
//

import SwiftUI

struct ListKindPickerView: View {
    @Binding var selection: ListKindEnum

    var body: some View {
        HStack(spacing: 20) {
            ForEach(ListKindEnum.allCases, id: \.self) { kind in
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
    @State var selection: ListKindEnum = .attendance
    
    return ListKindPickerView(selection: $selection)
}
