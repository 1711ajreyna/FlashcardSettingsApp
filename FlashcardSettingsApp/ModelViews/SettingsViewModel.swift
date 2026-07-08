//
//  SettingsViewModel.swift
//  FlashcardSettingsApp
//
//  Created by Andrew Reyna on 7/8/26.
//

import SwiftUI

// MARK: - Settings ViewModel
//
// The ViewModel holds the app's logic and state.
//
// In MVVM:
//
// Model = stores data
// ViewModel = manages logic and app state
// View = displays the user interface
//

class SettingsViewModel: ObservableObject {

    // MARK: - UserDefaults Settings
    //
    // @AppStorage saves small pieces of data using UserDefaults.
    // These values stay saved even after the app closes.

    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    @AppStorage("fontSize") var fontSize: Double = 22.0

    @AppStorage("accentColor") var accentColor: String = "Blue"

    // Extra setting 1
    @AppStorage("useRoundedCards") var useRoundedCards: Bool = true

    // Extra setting 2
    @AppStorage("useLargeSpacing") var useLargeSpacing: Bool = false

    // MARK: - Flashcard State
    //
    // @Published tells SwiftUI to refresh the screen when this changes.

    @Published var showAnswer: Bool = false

    @Published var currentIndex: Int = 0

    // MARK: - Flashcard Data
    //
    // This array stores the flashcards used in the app.

    let flashcards: [Flashcard] = [
        Flashcard(
            question: "What framework is used to build iOS user interfaces?",
            answer: "SwiftUI"
        ),
        Flashcard(
            question: "What does MVVM stand for?",
            answer: "Model View ViewModel"
        ),
        Flashcard(
            question: "What stores small settings across app sessions?",
            answer: "UserDefaults"
        )
    ]

    // MARK: - Accent Colors
    //
    // These are the color choices shown in SettingsView.

    let accentColors = ["Blue", "Red", "Green", "Purple"]

    // MARK: - Current Flashcard
    //
    // This returns the flashcard currently being shown.

    var currentFlashcard: Flashcard {
        flashcards[currentIndex]
    }

    // MARK: - Selected Color
    //
    // This converts the saved String value into a SwiftUI Color.

    var selectedColor: Color {
        switch accentColor {
        case "Red":
            return .red
        case "Green":
            return .green
        case "Purple":
            return .purple
        default:
            return .blue
        }
    }

    // MARK: - Flip Card
    //
    // This switches between the question and answer.

    func flipCard() {
        showAnswer.toggle()
    }

    // MARK: - Next Card
    //
    // This moves to the next flashcard.
    // If the user is on the last card, it goes back to the first card.

    func nextCard() {
        showAnswer = false

        if currentIndex < flashcards.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
    }

    // MARK: - Reset Settings
    //
    // This puts all settings back to their default values.

    func resetSettings() {
        isDarkMode = false
        fontSize = 22.0
        accentColor = "Blue"
        useRoundedCards = true
        useLargeSpacing = false
    }
}
