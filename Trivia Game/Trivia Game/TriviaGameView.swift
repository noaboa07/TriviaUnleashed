//
//  TriviaGameView.swift
//  Trivia Game
//
//  Created by Noah Russell on 11/10/24.
//

import SwiftUI

struct TriviaGameView: View {
    @State var triviaQuestions: [TriviaQuestion]
    let numberOfQuestions: Int
    let selectedCategory: String
    let selectedDifficulty: String
    let selectedType: String
    
    @State private var userAnswers: [Int?] = []
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var correctAnswers = 0  // Track correct answers
    @State private var showGameOver = false
    @State private var timeRemaining = 10 // Time per question in seconds
    @State private var timer: Timer?
    @State private var totalTimeSpent = 0  // Track total time spent on the quiz
    @State private var questionStartTime: Date? // Track when each question starts

    var body: some View {
        NavigationView {
            VStack {
                // Display current question number and total number of questions
                Text("Question \(currentQuestionIndex + 1) of \(numberOfQuestions)")
                    .font(.headline)
                    .padding(.top)

                // Display score and time remaining
                Text("Score: \(score)").font(.title).padding(.top)
                Text("Time Left: \(timeRemaining)").font(.subheadline)
                
                if currentQuestionIndex < triviaQuestions.count {
                    let currentQuestion = triviaQuestions[currentQuestionIndex]
                    
                    // Display the current question
                    Text(currentQuestion.decodedQuestion()).font(.headline).padding()
                    
                    // Display answers with styling for correct/selected answers
                    VStack(spacing: 10) {
                        ForEach(0..<currentQuestion.allAnswers.count, id: \.self) { index in
                            Button(action: {
                                // Answer selection logic
                                if userAnswers[currentQuestionIndex] == nil { // Ensure the user can only select one answer
                                    answerQuestion(selectedIndex: index)
                                }
                            }) {
                                Text(currentQuestion.allAnswers[index])
                                    .padding()
                                    .frame(maxWidth: .infinity, minHeight: 50) // Consistent height and width
                                    .background(
                                        // Background color logic
                                        userAnswers[currentQuestionIndex] == index ? (currentQuestion.allAnswers[index] == currentQuestion.correct_answer ? Color.green : Color.red) : // Show green if correct, red if wrong after selection
                                        (currentQuestion.allAnswers[index] == currentQuestion.correct_answer && userAnswers[currentQuestionIndex] != nil ? Color.green : Color.gray) // Correct answer in green after time runs out or when selected
                                    )
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .buttonStyle(PlainButtonStyle()) // Ensures consistent button layout without unwanted behavior
                            .disabled(userAnswers[currentQuestionIndex] != nil) // Disable buttons after answer selection or when time runs out
                        }
                    }
                    
                    // Button to proceed to the next question or show results
                    if currentQuestionIndex + 1 < triviaQuestions.count {
                        Button("Next Question", action: nextQuestion)
                            .padding()
                            .disabled(userAnswers[currentQuestionIndex] == nil) // Disable until answer is selected
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    } else {
                        // Show the "View Results" button only after the last question is answered
                        NavigationLink(destination: ResultsView(
                            score: score,
                            totalTime: totalTimeSpent,
                            averageTime: calculateAverageTime(),
                            totalQuestions: numberOfQuestions,
                            correctAnswers: correctAnswers
                        )) {
                            Text("View Results")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .disabled(userAnswers[currentQuestionIndex] == nil) // Disable until the last question is answered
                    }
                } else {
                    // Show game over message
                    Text("Game Over! Final Score: \(score)").font(.title).padding()
                    Button("Play Again", action: restartGame)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .onAppear {
                startGame()
            }
            .navigationTitle("Trivia Game")
        }
    }
    
    // Starts the game by fetching trivia questions from the API
    func startGame() {
        APIManager.shared.fetchTriviaQuestions(
            numberOfQuestions: numberOfQuestions,
            category: selectedCategory,
            difficulty: selectedDifficulty,
            type: selectedType
        ) { questions in
            if let questions = questions {
                self.triviaQuestions = questions
                userAnswers = Array(repeating: nil, count: questions.count)
                startTimer()
            }
        }
    }
    
    // Timer logic
    func startTimer() {
        timeRemaining = 10
        timer?.invalidate()
        questionStartTime = Date() // Track when the question starts
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                showCorrectAnswer() // Show correct answer when time is up
            }
        }
    }
    
    // Handles answer selection and updates the score
    func answerQuestion(selectedIndex: Int) {
        let currentQuestion = triviaQuestions[currentQuestionIndex]
        if currentQuestion.allAnswers[selectedIndex] == currentQuestion.correct_answer {
            score += 1
            correctAnswers += 1 // Increment correct answers
        }
        userAnswers[currentQuestionIndex] = selectedIndex
        timer?.invalidate() // Stop the timer after an answer is selected
        totalTimeSpent += Int(Date().timeIntervalSince(questionStartTime!)) // Add time spent on this question
    }

    // Move to the next question
    func nextQuestion() {
        if currentQuestionIndex + 1 < triviaQuestions.count {
            currentQuestionIndex += 1
            startTimer() // Restart the timer for the next question
        } else {
            timer?.invalidate() // End the game if no more questions
            showGameOver = true
        }
    }
    
    // Show the correct answer when time runs out
    func showCorrectAnswer() {
        let currentQuestion = triviaQuestions[currentQuestionIndex]
        // Show correct answer in green, even if the user didn't select it
        userAnswers[currentQuestionIndex] = currentQuestion.allAnswers.firstIndex(of: currentQuestion.correct_answer)
        timer?.invalidate() // Stop the timer when time runs out
        totalTimeSpent += Int(Date().timeIntervalSince(questionStartTime!)) // Add time spent on this question
    }

    // Restart the game
    func restartGame() {
        currentQuestionIndex = 0
        score = 0
        correctAnswers = 0 // Reset correct answers
        totalTimeSpent = 0 // Reset total time
        startGame() // Fetch new questions and start the timer again
    }

    // Calculate the total time spent on the quiz (this is a placeholder for now)
    func calculateTotalTime() -> Int {
        return totalTimeSpent
    }
    
    // Calculate the average time per question
    func calculateAverageTime() -> Double {
        return totalTimeSpent == 0 ? 0 : Double(totalTimeSpent) / Double(numberOfQuestions)
    }
}

