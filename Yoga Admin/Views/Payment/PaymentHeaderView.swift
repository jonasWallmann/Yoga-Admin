//
//  PaymentHeaderView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 24.02.24.
//

import SwiftUI

struct PaymentHeaderView: View {    
    var body: some View {
        HStack {
            Text("Student")
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Course")
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Amount")
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Start")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.headline)
        .foregroundStyle(Color.darkest)
        .padding(.leading, 30)
        .padding(.horizontal, 20)
        .padding(.bottom, 16)

        Divider()
            .padding(.horizontal, 20)
    }
}

#Preview {
    PaymentHeaderView()
}
