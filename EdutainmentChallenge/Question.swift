//
//  Question.swift
//  EdutainmentChallenge
//
//  Created by Duncan Kent on 09/03/2022.
//

import Foundation

struct Question: Identifiable {
    
    let id = UUID().uuidString
    let question: String
    let answer: Int
    
}
