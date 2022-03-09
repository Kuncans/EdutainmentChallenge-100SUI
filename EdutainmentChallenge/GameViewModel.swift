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
    
    @Published var askedQuestions = 1
    @Published var currentQuestion: Question? = nil
    @Published var answer: String = ""
    
    func startGame() {
        
        resetVals()
        
        let maxRange: Int
        
        switch difficulty {
        case .easy:
            maxRange = 5
        case .medium:
            maxRange = 12
        case .hard:
            maxRange = 20
        }
        
        var multiplier = 1
        
        for _ in 0..<maxRange {
            
            questions.append(Question(question: "\(multiplier) x \(timesTablesNumber)",
                                      answer: timesTablesNumber * multiplier))
            
            multiplier += 1
        }
        
        randomQuestion()
    }
    
    func randomQuestion() {
        currentQuestion = questions.randomElement() ?? Question(question: "0 x 0", answer: 0)
    }
    
    func checkAnswer() {
        if let validAnswer = Int(answer) {
            if validAnswer == currentQuestion?.answer {
                score += 1
            } else {
                score -= 1
            }
        }
        
        if !endGame() {
            resetVals()
            return
        }
        
        if let index = questions.firstIndex(where: {$0.id == currentQuestion?.id }) {
            questions.remove(at: index)
        }
        
        answer = ""
        askedQuestions += 1
        randomQuestion()
        
    }
    
    func endGame() -> Bool {
        if askedQuestions == numberOfQuestions { return false }
        return true
    }
    
    func resetVals() {
        score = 0
        askedQuestions = 1
        currentQuestion = nil
        answer = ""
    }
    
    
}
