//
//  AttendanceStudentListView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 07.03.24.
//

import SwiftUI

struct AttendanceStudentListView: View {
    let students: [Student]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(students) { student in
                VStack(alignment: .leading, spacing: 0) {
                    Divider()

                    HStack(spacing: 4) {
                        Text(student.firstName)
                            .fontWeight(.semibold)
                            .foregroundStyle(.darkest)
                        Text(student.lastName)
                            .foregroundStyle(.dark)
                    }
                    .padding(.leading, 12)
                    .frame(maxHeight: .infinity)
                }
                .frame(height: AttendanceSpacing.NAME_ROW_HEIGHT, alignment: .top)
            }
        }
    }
}

#Preview {
    let data = PreviewHelper.data

    return AttendanceStudentListView(students: [data.student])
}
