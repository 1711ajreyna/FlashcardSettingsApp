//
//  ContentView.swift
//  FlashcardSettingsApp
//
//  Created by Andrew Reyna on 7/8/26.
//

import SwiftUI

struct ContentView: View {

    // MARK: - ViewModel
    //
    // @StateObject creates ONE instance of the ViewModel.
    // This instance lives as long as ContentView exists.
    //
    // Since this is the first screen in our app,
    // it owns the ViewModel.
    //
    @StateObject private var vm = SettingsViewModel()

    var body: some View {

        NavigationStack {

            VStack(spacing: vm.useLargeSpacing ? 35 : 20) {

                // MARK: - App Title

                Text("Flashcard App")
                    .font(.largeTitle.bold())

                Text("Customize your learning experience with saved settings.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // MARK: - Flashcard View
                //
                // The flashcard itself lives in another View.
                // We pass our ViewModel so both screens
                // share the same data.
                //

                FlashcardView()
                    .environmentObject(vm)

                // MARK: - Settings Navigation

                NavigationLink {

                    SettingsView()
                        .environmentObject(vm)

                } label: {

                    Text("Open Settings")
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

                Spacer()
            }
            .padding(.top,30)

            .navigationTitle("Flashcards")

        }

        // MARK: - Dark Mode
        //
        // This changes the appearance of the app.
        //
        .preferredColorScheme(
            vm.isDarkMode ? .dark : .light
        )

        // MARK: - Accent Color
        //
        // This changes Navigation colors,
        // button tints,
        // sliders,
        // toggles,
        // etc.
        //
        .tint(vm.selectedColor)
    }
}

#Preview {

    ContentView()

}
