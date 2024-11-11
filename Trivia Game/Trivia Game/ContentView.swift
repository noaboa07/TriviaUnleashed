//
//  ContentView.swift
//  Trivia Game
//
//  Created by Noah Russell on 11/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var catImageURL: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Random Cat Image with better positioning
                AsyncImage(url: URL(string: catImageURL)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(.top, 50) // Push the image down
                } placeholder: {
                    ProgressView()
                }
                .onAppear {
                    fetchRandomCatImage()
                }

                Spacer()

                // Title
                Text("Welcome to Trivia Game!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                
                // Smaller text with the name and ID
                Text("by Noah Russell Z23667779")
                    .font(.footnote) // Smaller font size
                    .foregroundColor(.white)
                    .padding(.bottom, 30) // Add space below the name

                // Start Game Button - Navigates to the OptionsView
                NavigationLink("Start Game", destination: OptionsView())
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)

                Spacer()
            }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom))
            .ignoresSafeArea()
            .navigationTitle("") // Removes the default title
            .navigationBarHidden(true) // Hides the navigation bar completely
        }
    }
    
    // Fetch random cat image from the Cat API
    func fetchRandomCatImage() {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let decodedResponse = try? JSONDecoder().decode([CatImage].self, from: data) {
                if let imageUrl = decodedResponse.first?.url {
                    DispatchQueue.main.async {
                        catImageURL = imageUrl
                    }
                }
            }
        }.resume()
    }
}

// Model for decoding the cat image response
struct CatImage: Codable {
    var url: String
}
