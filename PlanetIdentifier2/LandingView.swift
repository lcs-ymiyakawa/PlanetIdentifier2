//
//  ContentView.swift
//  PlanetIdentifier2
//
//  Created by Yoshi Miyakawa on 2025/04/07.
//

import SwiftUI

struct LandingView: View {
    
    // MARK: Stored properties
    
    // What the user is supposed to guess
    @State var currentItem = itemsToSpell.randomElement()!
    
    // What the user has guessed
    @State var userGuess = ""
    
    // What was the outcome of a user making a guess?
    @State var currentOutcome: Outcome = .undetermined
    
    // The list of previous results
    @State var history: [Result] = [] // empty array
    
    // Keep track of what the user selected from the picker for filtering
    @State var selectedOutcomeFilter: Outcome = .undetermined // everything
    
    // MARK: Computed properties
    var body: some View {
        
        ZStack {
            Color.black
            HStack {
                
                // Left side
                VStack {
                    Image(currentItem.imageName)
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        TextField("Enter the name of the item", text: $userGuess)
                        
                        Text(currentOutcome.rawValue)
                    }
                    
                    
                    Button {
                        checkGuess()
                    } label: {
                        Text("Submit")
                    }
                    
                }
                .padding()
                
                // Right side
                VStack {
                    
                    // Picker to select what outcome to show
                    Picker("Filtering on", selection: $selectedOutcomeFilter) {
                        // Options that show up in the picker
                        Text("All results").tag(Outcome.undetermined)
                        Text("Correct").tag(Outcome.correct)
                        Text("Incorrect").tag(Outcome.incorrect)
                    }
                    
                    // List of previous outcomes
                    List(
                        
                        filtering(originalList: history, on: selectedOutcomeFilter)
                        
                    ) { currentResult in
                        
                        HStack {
                            
                            Image(currentResult.item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                            
                            Text(currentResult.guessProvided)
                            
                            Spacer()
                            
                            Text(currentResult.outcome.rawValue)
                            
                        }
                        
                    }
                    
                }
                
                
                
                
            }
        }
        
    }
    
    // MARK: Functions
    func checkGuess() {
        if userGuess == currentItem.word {
            currentOutcome = .correct
            print("Correct")
        } else {
            currentOutcome = .incorrect
            print("Incorrect")
        }
        
        
        // Save the prior result
        withAnimation(Animation.easeOut(duration: 2)) {
            history.insert(
                Result(
                    item: currentItem,
                    guessProvided: userGuess,
                    outcome: currentOutcome
                ),
                at: 0
            )
            
            // DEBUG: What is in the array now?
            print(history)
            
            // Picks a new word
            currentItem = itemsToSpell.randomElement()!
            userGuess = ""
            currentOutcome = .undetermined
        }
        
    }
    
}

#Preview {
    LandingView()
}
