//
//  ReRegistrationTableView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 09.03.24.
//

import SwiftUI

struct ReRegistrationTableView: View {
    let course: Course
    let rowCount: Int

    private var height: CGFloat {
        CGFloat(1 + rowCount) * 40
    }

    var body: some View {
        HStack(spacing: 0) {
            Divider()

            VStack(spacing: 0) {
                Divider()
                ReRegistrationCourseInfoView(course: course)
                Divider()
                Divider()

                VStack(spacing: 0) {
                    HStack(spacing: 1) {
                        Text("Name")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                            .foregroundStyle(.darkest)
                        Divider()
                        Text("Signature")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                            .foregroundStyle(.darkest)
                    }
                    .font(.headline)

                    ForEach(0 ..< rowCount, id: \.self) { _ in
                        Divider()
                        HStack {
                            Divider()
                        }
                    }
                }
                .frame(height: height)

                Divider()
            }
            Divider()
        }
        .frame(minWidth: 400, maxWidth: 600)
    }
}

#Preview {
    let data = PreviewHelper.data

    return ReRegistrationTableView(course: data.course, rowCount: 7)
        .background(Color.snow)
}
