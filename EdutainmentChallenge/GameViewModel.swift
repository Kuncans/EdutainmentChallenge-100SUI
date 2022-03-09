//
//  GameViewModel.swift
//  EdutainmentChallenge
//
//  Created by Duncan Kent on 09/03/2022.
//

import Foundation

final class GameViewModel: ObservableObject {
    
    @Published var questions: [Question] = []
    @Published var questionOptions: [Int] = [5, 10, 15]
    @Published var numberOfQuestions: Int = 10
    @Published var timesTablesNumber: Int = 4
    @Published var difficulty: Difficulty = .medium
    
    @Published var score: Int = 0
    
    func startGame() {
        
        let maxRange: Int
        
        switch difficulty {
        case .easy:
            maxRange = 12
        case .medium:
            maxRange = 20
        case .hard:
            maxRange = 30
        }
        
        var multiplier = 1
        
        for _ in 0..<maxRange {
            
            questions.append(Question(question: "\(timesTablesNumber) x \(multiplier)",
                                      answer: timesTablesNumber * multiplier))
            
            multiplier += 1
        }
    }
    
    func randomQuestion() -> Question {
        return questions.randomElement() ?? Question(question: "0 x 0", answer: 0)
    }
    
    
    
    
    
}
