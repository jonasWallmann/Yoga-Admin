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
    
    @Bindable public var vm: StudentsVM

    var searchResults: [Student] {
        vm.searchResults(in: students)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            SearchField("name...", value: $vm.query)
                .padding(.trailing)

            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(searchResults) { student in
                        divider
                        
                        Button {
                            vm.student = student
                        } label: {
                            if vm.student == student {
                                HStack(spacing: 4) {
                                    Text(student.firstName)
                                        .fontWeight(.semibold)
                                    Text(student.lastName)
                                    Spacer()
                                }
                                .foregroundStyle(Color.white)
                                .padding(.leading, 8)
                                .padding(.vertical, 6)
                                .background(Color.accent, in: .rect(cornerRadius: 8))
                                .padding(.trailing, 12)
                                .padding(.vertical, 6)
                                .background(Color.white) // needed for button target area
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
                                .background(Color.white) // needed for button target area
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
                vm.student = newResults.first
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

    return StudentsSearchView(vm: StudentsVM())
        .modelContainer(container)
        .frame(maxWidth: 240)
        .frame(maxWidth: .infinity, alignment: .leading)
}
