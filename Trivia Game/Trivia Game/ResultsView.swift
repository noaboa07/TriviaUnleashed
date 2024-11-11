//
//  ResultsView.swift
//  Trivia Game
//
//  Created by Noah Russell on 11/10/24.
//

import SwiftUI

struct ResultsView: View {
    var score: Int
    var totalTime: Int
    var averageTime: Double
    var totalQuestions: Int // New variable to represent the total number of questions
    var correctAnswers: Int // New variable to represent the number of correct answers
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            // Title
            Text("Game Over!")
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .foregroundColor(.yellow)
                .shadow(radius: 10)
                .padding(.top, 50)
                .frame(maxWidth: .infinity, alignment: .center)

            // Score: Correct / Total Questions
            Text("Your Score: \(correctAnswers)/\(totalQuestions)")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.green)
                .padding(.top, 20)
                .shadow(color: .black, radius: 5, x: 0, y: 3)

            // Total Time Taken
            Text("Total Time: \(totalTime) seconds")
                .font(.title2)
                .italic()
                .foregroundColor(.white)
                .padding(.top, 10)
                .shadow(color: .black, radius: 5, x: 0, y: 3)

            // Average Time per Question
            Text("Average Time per Question: \(String(format: "%.2f", averageTime)) seconds")
                .font(.title2)
                .foregroundColor(.orange)
                .padding(.top, 10)
                .shadow(color: .black, radius: 5, x: 0, y: 3)

            // Performance Rating based on score
            Text("Performance Rating: \(performanceRating())")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 20)
                .shadow(color: .black, radius: 5, x: 0, y: 3)
            
            Spacer()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.pink]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Results")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: EmptyView())
        .multilineTextAlignment(.center)
        .transition(.opacity) // Smooth transition effect
    }
    
    // A function to calculate the performance rating based on score
    func performanceRating() -> String {
        let percentage = Double(correctAnswers) / Double(totalQuestions) * 100
        switch percentage {
        case 90...100:
            return "⭐ Excellent ⭐"
        case 70...89:
            return "👍 Good 👍"
        case 50...69:
            return "😐 Average 😐"
        default:
            return "🚧 Needs Improvement 🚧"
        }
    }
}
