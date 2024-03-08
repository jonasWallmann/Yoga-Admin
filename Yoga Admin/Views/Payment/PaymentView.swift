//
//  PaymentView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftData
import SwiftUI

struct PaymentView: View {
    @Environment(\.modelContext) private var modelContext

    @Query(filter: #Predicate<Registration> { registration in
        registration.paid == false
    }) var unpaidRegistrations: [Registration]

    private var sortedUnpaidRegistrations: [Registration] {
        return unpaidRegistrations.filter { registration in
            guard let student = registration.student else { return true }

            return searchText.isEmpty || student.name.localizedStandardContains(searchText)
        }
        .sorted { left, right in
            left.student?.name ?? "" < right.student?.name ?? ""
        }
    }

    @State private var searchText = String()

    @State private var madeChanges = [Registration]()
    @State private var isSaving = false

    var body: some View {
        if unpaidRegistrations.isEmpty {
            EmptyView(label: "No open payments", systemImage: "checkmark.circle")
        } else {
            VStack(spacing: 20) {
                HStack {
                    SearchField("name...", value: $searchText)
                        .frame(maxWidth: 240)
                    Spacer()
                    Button("Save changes", action: save)
                        .buttonStyle(Primary())
                        .disabled(madeChanges.isEmpty)
                }

                VStack(spacing: 0) {
                    PaymentHeaderView()

                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(sortedUnpaidRegistrations) { registration in
                                PaymentRowView(registration: registration, isSaving: isSaving, madeChanges: $madeChanges)
                                Divider()
                            }
                        }
                        .padding(20)
                    }
                }
                .padding(.top, 20)
                .section(padding: 0)
            }
            .frame(maxWidth: 1000)
            .padding(.bottom, 24)
            .screen()
        }
    }

    private func save() {
        isSaving = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            isSaving = false
        }
        searchText = String()
    }
}

#Preview {
    let (container, _) = PreviewHelper.content

    return PaymentView()
        .modelContainer(container)
}
