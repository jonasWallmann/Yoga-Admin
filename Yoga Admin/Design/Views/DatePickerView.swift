//
//  DatePickerView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var start: Date
    @Binding var end: Date

    let components: DatePickerComponents

    private var width: CGFloat {
        components == .date ? 200 : 160
    }

    private var label: String {
        components == .date ? "Date" : "Time"
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            HStack {
                Text("start")
                    .frame(width: 44, alignment: .leading)
                DatePicker("start", selection: $start, displayedComponents: components)
            }
            HStack {
                Text("end")
                    .frame(width: 44, alignment: .leading)
                DatePicker("end", selection: $end, displayedComponents: components)
            }
        }
        .labelsHidden()
        .frame(width: width, alignment: .leading)
    }
}

#Preview {
    DatePickerView(start: .constant(.now), end: .constant(.now), components: .date)
        .padding()
}
