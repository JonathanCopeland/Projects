//
//  ContentView.swift
//  SwiftyWords
//
//  Created by Jonathan Copeland on 22/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var model: LevelViewModel
    var category: Category
    var levelNumber: Int
    
    init(category: Category, levelNumber: Int) {
        
        self.category = category
        self.levelNumber = levelNumber
        
        _model = StateObject(wrappedValue: {
            LevelViewModel(words: category.levels[levelNumber])
        }())
    }
    
    var body: some View {
        VStack {
            // clues
            
            VStack {
                ForEach(model.answers) { answer in
                    HStack {
                        if answer.isSolved {
                            Text(answer.word.solution)
                        } else {
                            Text(answer.word.hint)
                            Spacer()
                            Image(systemName: answer.imageName)
                        }
                    }
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold(answer.isSolved)
                    
                    Spacer()
                }
            }
        
            Text(model.currentAnswer)
                .font(.title)
                .lineLimit(1)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.quaternary)
                .cornerRadius(5)
                .overlay(alignment: .trailing) {
                    Button(action: model.delete) {
                        Label("Delete", systemImage: "delete.left")
                            .font(.title)
                            .labelStyle(.iconOnly)
                    }
                    .buttonStyle(.plain)
                    .offset(x: -10)
                }
            
            Spacer()
            
            // segments
            
            LazyVGrid(columns: Array<GridItem>(repeating: .init(.flexible()), count: 4)) {
                ForEach(0..<model.segments.count, id: \.self) { index in
                    let segment = model.segments[index]
                    
                    Button {
                        model.select(index)
                    } label: {
                        SegmentView(segment: segment)
                    }
                    .buttonStyle(.plain)
                    .disabled(segment.isUsed)
                    .disabled(model.selectedSegments.count == 7)
                }
            }
        }
        .padding()
        .navigationTitle("Level \(levelNumber + 1)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(category: .example, levelNumber: 0)
    }
}
