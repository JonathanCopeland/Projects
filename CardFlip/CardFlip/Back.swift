//
//  Back.swift
//  CardFlip
//
//  Created by Jonathan Copeland on 21/03/2024.
//

import SwiftUI

struct Back: View {
    var body: some View {
        Rectangle()
            .fill(.blue)
            .cornerRadius(24)
            .frame(width: 300, height: 400)
    }
}

#Preview {
    Back()
}
