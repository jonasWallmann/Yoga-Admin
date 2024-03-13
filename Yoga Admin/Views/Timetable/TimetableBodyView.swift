//
//  TimetableBodyView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 21.02.24.
//

import SwiftUI

private let H_SPACING: CGFloat = 52
private let MIN_WIDTH: CGFloat = 104
private let MAX_Width: CGFloat = 112

struct TimetableBodyView: View {
    let timeRows: [[Course?]]
    let dayCount: Int

    let kind: TableKind

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: H_SPACING) {
                ForEach(0 ..< dayCount, id: \.self) { dayNr in
                    Text(Calendar.dayNames[dayNr])
                        .frame(minWidth: MIN_WIDTH, maxWidth: MAX_Width)
                }
            }
            .font(.title2)
            .fontWeight(.medium)
            .foregroundStyle(Color.dark)
            .padding(.horizontal, 12)

            ScrollView {
                VStack(spacing: 32) {
                    ForEach(0 ..< timeRows.count, id: \.self) { rowNumber in
                        HStack(alignment: .top, spacing: H_SPACING) {
                            ForEach(0 ..< timeRows[rowNumber].count, id: \.self) { courseNumber in
                                CourseCardView(course: timeRows[rowNumber][courseNumber], kind: kind)
                                    .frame(minWidth: MIN_WIDTH, maxWidth: MAX_Width)
                            }
                        }
                    }
                }
                .animation(.easeInOut, value: kind)
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview(traits: .fixedLayout(width: 850, height: 700)) {
    let data = PreviewHelper.data

    let vm = TimetableVM()
    vm.create(for: data.courses)

    return TimetableBodyView(timeRows: vm.timeRows, dayCount: 5, kind: .information)
        .screen()
}
