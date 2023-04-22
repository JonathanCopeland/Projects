//
//  DataTypes.swift
//  SwiftyWords
//
//  Created by Jonathan Copeland on 22/04/2023.
//

import Foundation

struct Category: Hashable, Identifiable, Decodable {
    var id: String {name}
    var name: String
    var description: String
    var levels: [[Word]]
    
    static let example = Category(name: "Example", description: "An example", levels: [[.example]])
}

struct Word: Hashable, Decodable {
    var id: String {hint}
    var solution: String
    var hint: String
    var segments: [String]
    
    static let example = Word(solution: "Example solution", hint: "Example hint", segments: ["ABC", "DEF"])
}

struct Answer: Identifiable {
    var id: String {word.hint}
    var word: Word
    var isSolved = false
    
    init(word: Word) {
        self.word = word
    }
    
    var imageName: String {
        "\(word.solution.count).circle"
    }
}

struct Segment {
    var text: String
    var isUsed = false
    
    init(text: String) {
        self.text = text
    }
    
    static let example = Segment(text: "ABC")
}
