//
//  PricePickerView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftUI

struct PricePickerView: View {
    @Binding var price: Double?

    var body: some View {
        HStack {
            Text("Price")
                .font(.headline)
            Spacer()
            TextField("", value: $price, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .frame(width: 125)
                .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    PricePickerView(price: .constant(0))
}
