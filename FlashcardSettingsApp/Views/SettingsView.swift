//
//  SettingsView.swift
//  FlashcardSettingsApp
//
//  Created by Andrew Reyna on 7/8/26.
//

import SwiftUI

struct SettingsView: View {

    // MARK: - Shared ViewModel
    //
    // This View receives the same ViewModel created in ContentView.
    // Every change made here immediately updates the rest of the app.
    //
    @EnvironmentObject var vm: SettingsViewModel

    var body: some View {

        Form {

            // MARK: Theme Section

            Section("Theme") {

                // Turns Dark Mode on and off.
                Toggle("Dark Mode", isOn: $vm.isDarkMode)

                // Lets the user pick an accent color.
                Picker("Accent Color", selection: $vm.accentColor) {

                    ForEach(vm.accentColors, id: \.self) { color in
                        Text(color)
                    }
                }
            }

  
            // MARK: Font Section


            Section("Font Size") {

                // Slider changes the flashcard font size.
                Slider(
                    value: $vm.fontSize,
                    in: 16...34,
                    step: 1
                )

                Text("Current Font Size: \(Int(vm.fontSize))")
                    .font(.system(size: vm.fontSize))
            }


            // MARK: Flashcard Style


            Section("Flashcard Style") {

                // Extra AppStorage Setting #1
                Toggle(
                    "Rounded Flashcards",
                    isOn: $vm.useRoundedCards
                )

                // Extra AppStorage Setting #2
                Toggle(
                    "Large Spacing",
                    isOn: $vm.useLargeSpacing
                )
            }


            // MARK: Preview


            Section("Preview") {

                Text("These settings are automatically saved using UserDefaults.")
                    .foregroundStyle(vm.selectedColor)

                Text("Preview Text")
                    .font(.system(size: vm.fontSize))
                    .foregroundStyle(vm.selectedColor)
            }


            // MARK: Reset Button


            Section {

                Button("Reset to Default Settings") {

                    vm.resetSettings()

                }
                .foregroundStyle(.red)

            }

        }

        // Navigation Title
        .navigationTitle("Settings")

        // Applies Dark Mode
        .preferredColorScheme(
            vm.isDarkMode ? .dark : .light
        )

        // Applies Accent Color
        .tint(vm.selectedColor)

    }
}

#Preview {

    NavigationStack {

        SettingsView()
            .environmentObject(SettingsViewModel())

    }

}
