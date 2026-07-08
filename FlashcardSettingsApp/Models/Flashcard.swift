//
//  Flashcard.swift
//  FlashcardSettingsApp
//
//  Created by Andrew Reyna on 7/8/26.
//

import Foundation

struct Flashcard: Identifiable {
    let id = UUID()
    let question: String
    let answer: String
}
