//
//  LevelViewModel.swift
//  SwiftyWords
//
//  Created by Jonathan Copeland on 22/04/2023.
//

import Foundation

class LevelViewModel: ObservableObject {
    private(set) var answers: [Answer]
    private(set) var segments: [Segment]
    @Published var selectedSegments = [Int]()
    
    init(words:[Word]) {
        answers = words.map(Answer.init)
        segments = words.flatMap(\.segments).shuffled().map(Segment.init)
    }
    
    var currentAnswer: String {
        if selectedSegments.isEmpty {
            return " "
        } else {
            return selectedSegments.map {segments[$0].text}.joined()
        }
        
    }
    
    func select(_ index: Int) {
        segments[index].isUsed = true
        selectedSegments.append(index)
        
        let userAnswer = currentAnswer
        
        let match = answers.firstIndex {
            $0.word.solution == userAnswer
        }
        
        if let match {
            selectedSegments.removeAll()
            answers[match].isSolved = true
        }
        
    }
    
    func delete() {
        if let removed = selectedSegments.popLast() {
            segments[removed].isUsed = false
        }
    }
    
    
    
}

