//
//  Front.swift
//  CardFlip
//
//  Created by Jonathan Copeland on 21/03/2024.
//

import SwiftUI

struct Front: View {
    var body: some View {
        Rectangle()
            .fill(.red)
            .cornerRadius(24)
            .frame(width: 300, height: 400)
        
    }
}

#Preview {
    Front()
}
