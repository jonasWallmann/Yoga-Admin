//
//  RegistrationView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftData
import SwiftUI

struct RegistrationView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(AppVM.self) private var appVM

    @Query private var students: [Student]
    @Query private var registrations: [Registration]

    @State private var vm = RegistrationVM()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button {
                vm.save(modelContext: modelContext, students: students, registrations: registrations)
            } label: {
                Text("Save")
                    .padding(.horizontal, 20)
            }
            .buttonStyle(Primary())
            .frame(maxWidth: .infinity, alignment: .trailing)

            HStack(alignment: .top, spacing: 32) {
                PersonalInformationView(vm: vm)
                    .card()

                CourseSelectionView(selection: $vm.course, group: appVM.group, showingValidationError: vm.showingValidationError)
                    .padding(.top, 20)
                    .card(hasPadding: false)
            }
        }
        .frame(maxWidth: 740)
        .padding(.bottom, 32)
        .padding(.leading, 8)
        .screen()
    }
}

#Preview("Registration", traits: traits) {
    let (container, appVM) = PreviewHelper.content

    return RegistrationView()
        .modelContainer(container)
        .environment(appVM)
}
