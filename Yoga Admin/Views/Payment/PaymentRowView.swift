//
//  PaymentRowView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 24.02.24.
//

import SwiftUI

struct PaymentRowView: View {
    @State var registration: Registration

    @State private var isPaid: Bool

    let isSaving: Bool

    @Binding var madeChanges: [Registration]

    init(registration: Registration, isSaving: Bool, madeChanges: Binding<[Registration]>) {
        self.registration = registration
        self.isPaid = registration.paid
        self.isSaving = isSaving
        self._madeChanges = madeChanges
    }

    var body: some View {
        HStack {
            CheckBox(isSelected: isPaid, selectionCallback: clickedCheckbox)
                .padding(.leading, 2)
                .padding(.trailing, 8)

            Text(registration.student?.name ?? "unknown")
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(registration.course?.name ?? "unknown")
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(registration.course?.price ?? 0.0, format: .currency(code: "EUR"))
                .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                if let start = registration.course?.startsInDays {
                    if start < 0 {
                        Text("\(abs(start)) days ago")
                    } else if start == 0 {
                        Text("today")
                    } else {
                        Text("in \(start) days")
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .onChange(of: isSaving) { _, newValue in
            if newValue {
                save()
            }
        }
    }

    private func clickedCheckbox() {
        isPaid.toggle()

        if let index = madeChanges.firstIndex(where: { $0 == registration }) {
            if madeChanges[index].paid == isPaid {
                madeChanges.remove(at: index)
            }
        } else {
            madeChanges.append(registration)
        }

        if isSaving {
            save()
        }
    }

    private func save() {
        registration.paid = isPaid
    }
}

#Preview {
    let data = PreviewHelper.data
    let registration = Registration(note: "", student: data.student, course: data.course)

    return PaymentRowView(registration: registration, isSaving: true, madeChanges: .constant([]))
        .padding()
}
