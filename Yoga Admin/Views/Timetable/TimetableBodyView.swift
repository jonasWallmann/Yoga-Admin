//
//  TimetableBodyView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 21.02.24.
//

import SwiftUI

struct TimetableBodyView: View {
    let timeRows: [[Course?]]
    let dayCount: Int

    let kind: TableKind

    var body: some View {
        VStack(spacing: 28) {
            HStack(spacing: 56) {
                ForEach(0 ..< dayCount, id: \.self) { dayNr in
                    Text(Calendar.dayNames[dayNr])
                        .frame(minWidth: 100, maxWidth: 120)
                }
            }
            .font(.title2)
            .fontWeight(.medium)
            .foregroundStyle(Color.dark)
            .padding(.horizontal)

            ScrollView {
                VStack(spacing: 28) {
                    ForEach(0 ..< timeRows.count, id: \.self) { rowNumber in
                        HStack(alignment: .top, spacing: 56) {
                            ForEach(0 ..< timeRows[rowNumber].count, id: \.self) { courseNumber in
                                CourseCardView(course: timeRows[rowNumber][courseNumber], kind: kind)
                                    .frame(minWidth: 100, maxWidth: 120)
                            }
                        }
                    }
                }
                .animation(.easeInOut, value: kind)
                .padding()
            }
        }
    }
}

#Preview {
    let (course, _) = PreviewHelper.data

    return TimetableBodyView(timeRows: [[course, course]], dayCount: 2, kind: .information)
        .padding()
}
