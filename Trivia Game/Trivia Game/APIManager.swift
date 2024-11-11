//
//  APIManager.swift
//  Trivia Game
//
//  Created by Noah Russell on 11/10/24.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    func fetchTriviaQuestions(numberOfQuestions: Int, category: String, difficulty: String, type: String, completion: @escaping ([TriviaQuestion]?) -> Void) {
        let baseURL = "https://opentdb.com/api.php"
        let urlString = "\(baseURL)?amount=\(numberOfQuestions)&category=\(category)&difficulty=\(difficulty)&type=\(type)"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(TriviaResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(response.results)
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}
