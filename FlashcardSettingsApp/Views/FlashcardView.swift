//
//  FlashcardView.swift
//  FlashcardSettingsApp
//
//  Created by Andrew Reyna on 7/8/26.
//

import SwiftUI

struct FlashcardView: View {

    // MARK: - Shared ViewModel
    //
    // @EnvironmentObject lets this view use the same ViewModel
    // that was created in ContentView.
    //
    // This means FlashcardView can access:
    // - flashcards
    // - font size
    // - accent color
    // - rounded card setting
    // - flip card logic
    //
    @EnvironmentObject var vm: SettingsViewModel

    var body: some View {

        VStack(spacing: 20) {

            // MARK: - Flashcard Card
            //
            // This Text changes depending on whether showAnswer is true or false.
            //
            // If showAnswer is false, it shows the question.
            // If showAnswer is true, it shows the answer.
            //
            Text(vm.showAnswer ? vm.currentFlashcard.answer : vm.currentFlashcard.question)
                .font(.system(size: vm.fontSize, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding()
                .frame(maxWidth: .infinity, minHeight: 190)
                .background(vm.selectedColor.opacity(0.15))
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: vm.useRoundedCards ? 24 : 4
                    )
                )
                .overlay(
                    RoundedRectangle(
                        cornerRadius: vm.useRoundedCards ? 24 : 4
                    )
                    .stroke(vm.selectedColor, lineWidth: 2)
                )
                .padding(.horizontal)

            // MARK: - Flip Button
            //
            // This button calls vm.flipCard().
            // The logic stays inside the ViewModel,
            // not inside the View.
            //
            Button {
                vm.flipCard()
            } label: {
                Text(vm.showAnswer ? "Show Question" : "Show Answer")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(vm.selectedColor)
                    .foregroundStyle(.white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                    )
            }
            .padding(.horizontal)

            // MARK: - Next Card Button
            //
            // This moves to the next flashcard.
            // The function also resets the card back to the question side.
            //
            Button {
                vm.nextCard()
            } label: {
                Text("Next Card")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(vm.selectedColor, lineWidth: 2)
                    )
            }
            .padding(.horizontal)

            // MARK: - Card Counter
            //
            // Shows which flashcard the user is currently viewing.
            //
            Text("Card \(vm.currentIndex + 1) of \(vm.flashcards.count)")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    let vm = SettingsViewModel()

    return FlashcardView()
        .environmentObject(vm)
}
