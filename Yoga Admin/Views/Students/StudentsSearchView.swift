//
//  StudentsSearchView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 23.02.24.
//

import SwiftData
import SwiftUI

struct StudentsSearchView: View {
    @Query(sort: \Student.firstName) private var students: [Student]

    @State private var searchText = String()

    @Binding var selection: Student?

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            SearchField("name...", value: $searchText)
                .padding(.trailing)

            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(searchResults) { student in
                        divider
                        
                        Button {
                            selection = student
                        } label: {
                            if selection == student {
                                HStack(spacing: 4) {
                                    Text(student.firstName)
                                        .fontWeight(.semibold)
                                    Text(student.lastName)
                                    Spacer()
                                }
                                .foregroundStyle(Color.white)
                                .padding(.leading, 8)
                                .padding(.vertical, 6)
                                .background(Color.accent)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding(.trailing, 12)
                                .padding(.vertical, 6)
                            } else {
                                HStack(spacing: 4) {
                                    Text(student.firstName)
                                        .foregroundStyle(Color.darkest)
                                        .bold()
                                    Text(student.lastName)
                                        .foregroundStyle(Color.dark)
                                    Spacer()
                                }
                                .padding(.vertical, 12)
                            }
                        }
                        .buttonStyle(.plain)
                        
                        divider
                    }
                }
            }
        }
        .padding(.top, 36)
        .padding(.leading)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color.snow)
        .onChange(of: searchResults) { oldResults, newResults in
            if newResults.count == 1 {
                selection = newResults.first
            }
        }
    }

    private var searchResults: [Student] {
        if searchText.isEmpty {
            return students
        } else {
            let matchingStudents = students.filter { $0.name.localizedStandardContains(searchText) }
            
            return matchingStudents.sorted { left, right in
                var offLeft = 0
                var offRight = 0

                for charIndex in 0 ..< searchText.count {
                    let searchChar = searchText.index(searchText.startIndex, offsetBy: charIndex)
                    let leftChar = left.name.index(left.name.startIndex, offsetBy: charIndex)
                    let rightChar = right.name.index(right.name.startIndex, offsetBy: charIndex)

                    offLeft += leftChar == searchChar ? 0 : 1
                    offRight += rightChar == searchChar ? 0 : 1

                }
                return offLeft < offRight
            }
        }
    }

    private var divider: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(Color.lightest)
    }
}

#Preview {
    @State var student: Student?

    let (container, _) = PreviewHelper.content

    return StudentsSearchView(selection: $student)
        .modelContainer(container)
        .frame(maxWidth: 240)
        .frame(maxWidth: .infinity, alignment: .leading)
}
