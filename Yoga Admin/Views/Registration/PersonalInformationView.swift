//
//  RegistrationInformationView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftUI
import SwiftData

struct PersonalInformationView: View {
    @Query private var students: [Student]

    @Bindable var vm: RegistrationVM

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Information")
                .font(.headline)
                .foregroundStyle(Color.darkest)
            Divider()

            VStack(alignment: .leading, spacing: 24) {
                TextField("First name...", text: $vm.firstName)
                    .onChange(of: vm.firstName) { _, newFirstName in
                        vm.checkSuggestion(newFirstName: newFirstName, from: students)
                    }

                TextField("Last name...", text: $vm.lastName)
                    .onChange(of: vm.lastName) { _, newLastName in
                        vm.checkSuggestion(newLastName: newLastName, from: students)
                    }

                TextField("Email...", text: $vm.email)
                    .onChange(of: vm.email) { _, newEmail in
                        vm.checkSuggestion(newEmail: newEmail, from: students)
                    }

                TextField("Phone...", text: $vm.phone)

                TextField("Address 1...", text: $vm.address1)
                TextField("Address 2...", text: $vm.address2)
            }

            if let suggestedStudent = vm.suggestedStudent {
                Button(action: vm.fillOutForSuggestedStudent) {
                    Text("Fill out for \(suggestedStudent.name)")
                }
                .buttonStyle(Tertiary())
            }
        }
        .textFieldStyle(Custom())
    }
}

#Preview("Personal information") {
    let (container, _) = PreviewHelper.content

    return PersonalInformationView(vm: RegistrationVM())
        .modelContainer(container)
}
