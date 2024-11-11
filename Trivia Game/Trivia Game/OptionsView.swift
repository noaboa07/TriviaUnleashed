//
//  OptionsView.swift
//  Trivia Game
//
//  Created by Noah Russell on 11/10/24.
//

import SwiftUI

struct OptionsView: View {
    @State private var numberOfQuestions = 10
    @State private var selectedCategory = "9" // General Knowledge
    @State private var selectedDifficulty = "easy"
    @State private var selectedType = "multiple"
    
    let categories = ["9": "General Knowledge", "17": "Science", "15": "Entertainment: Video Games"]
    let difficulties = ["easy", "medium", "hard"]
    let types = ["multiple", "boolean"]

    var body: some View {
        Form {
            Section(header: Text("Game Options")) {
                Picker("Number of Questions", selection: $numberOfQuestions) {
                    ForEach([5, 10, 15, 20], id: \.self) { num in
                        Text("\(num) Questions")
                    }
                }
                
                Picker("Category", selection: $selectedCategory) {
                    ForEach(categories.keys.sorted(), id: \.self) { key in
                        Text(categories[key]!)
                    }
                }
                
                Picker("Difficulty", selection: $selectedDifficulty) {
                    ForEach(difficulties, id: \.self) { difficulty in
                        Text(difficulty.capitalized)
                    }
                }
                
                Picker("Question Type", selection: $selectedType) {
                    ForEach(types, id: \.self) { type in
                        Text(type.capitalized)
                    }
                }
            }

            NavigationLink(destination: TriviaGameView(
                triviaQuestions: [],
                numberOfQuestions: numberOfQuestions,
                selectedCategory: selectedCategory,
                selectedDifficulty: selectedDifficulty,
                selectedType: selectedType
            )) {
                Text("Start Game")
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Trivia Options")
    }
}
