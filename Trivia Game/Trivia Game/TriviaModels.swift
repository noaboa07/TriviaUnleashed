//
//  TriviaModels.swift
//  Trivia Game
//
//  Created by Noah Russell on 11/10/24.
//

import Foundation

struct TriviaResponse: Codable {
    var results: [TriviaQuestion]
}

struct TriviaQuestion: Codable {
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
    var type: String
    var category: String
    var difficulty: String
    
    // Property to store shuffled answers
    private(set) var allAnswers: [String]

    // Custom initializer to shuffle answers only once
    init(question: String, correct_answer: String, incorrect_answers: [String], type: String, category: String, difficulty: String) {
        self.question = question
        self.correct_answer = correct_answer
        self.incorrect_answers = incorrect_answers
        self.type = type
        self.category = category
        self.difficulty = difficulty
        
        // Shuffle the answers only once
        self.allAnswers = ([correct_answer] + incorrect_answers).shuffled()
    }

    // Conformance to Codable
    enum CodingKeys: String, CodingKey {
        case question, correct_answer, incorrect_answers, type, category, difficulty
    }
    
    // Custom decoder to shuffle the answers after decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.question = try container.decode(String.self, forKey: .question)
        self.correct_answer = try container.decode(String.self, forKey: .correct_answer)
        self.incorrect_answers = try container.decode([String].self, forKey: .incorrect_answers)
        self.type = try container.decode(String.self, forKey: .type)
        self.category = try container.decode(String.self, forKey: .category)
        self.difficulty = try container.decode(String.self, forKey: .difficulty)
        
        // Shuffle the answers only once after decoding
        self.allAnswers = ([correct_answer] + incorrect_answers).shuffled()
    }
    
    func decodedQuestion() -> String {
        question
            .replacingOccurrences(of: "&quot;", with: "\"")
            .replacingOccurrences(of: "&amp;", with: "&")
    }
}
