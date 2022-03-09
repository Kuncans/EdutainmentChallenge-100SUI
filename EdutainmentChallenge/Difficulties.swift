//
//  Difficulties.swift
//  EdutainmentChallenge
//
//  Created by Duncan Kent on 09/03/2022.
//

import Foundation

enum Difficulty: String, Identifiable, CaseIterable {
    case easy
    case medium
    case hard
    var id: Self { self } 
}
