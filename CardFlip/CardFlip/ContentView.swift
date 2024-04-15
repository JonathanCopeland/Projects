//
//  ContentView.swift
//  CardFlip
//
//  Created by Jonathan Copeland on 21/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var angle: Double = 0
    @GestureState private var dragState = CGSize.zero
    @State private var isDragging = false

    var body: some View {
        VStack {
            ZStack {
                Front()
                    .rotation3DEffect(.degrees(angle), axis: (x: 0, y: 1, z: 0))
                    .opacity(angle < 90 || angle > -90 ? 1 : 0)
                Back()
                    .rotation3DEffect(.degrees(angle + 180), axis: (x: 0, y: 1, z: 0))
                    .opacity(angle < 90 || angle > -90 ? 0 : 1)
            }
        }
        .gesture(
            DragGesture()
                .updating($dragState) { value, state, _ in
                    state = value.translation
                    let dragAngle = value.translation.width / -20
                    angle += dragAngle
                    angle = angle.truncatingRemainder(dividingBy: 360)
                }
                .onEnded { value in
                    self.isDragging = false
                    // Snap logic to ensure the card aligns correctly after drag
                    let remainder = angle.truncatingRemainder(dividingBy: 180)
                    let adjustment = remainder > 90 ? 180 - remainder : -remainder
                    withAnimation {
                        angle += adjustment
                        angle = angle.truncatingRemainder(dividingBy: 360)
                    }
                }
        )
    }
}




#Preview {
    ContentView()
}
