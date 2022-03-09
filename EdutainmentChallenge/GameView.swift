//
//  GameView.swift
//  EdutainmentChallenge
//
//  Created by Duncan Kent on 09/03/2022.
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var vm = GameViewModel()
        
    var body: some View {
        NavigationView {
            Form {
                
                Section("Multiplication Number") {
                    Stepper("                    \(vm.timesTablesNumber)", value: $vm.timesTablesNumber, in: 1...12)
                        .font(.headline)
                }
                
                Section("Number of Questions") {
                    Picker("Questions", selection: $vm.numberOfQuestions) {
                        ForEach(vm.questionOptions, id: \.self) { num in
                            Text("\(num)")
                                .font(.headline)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Difficulty") {
                    Picker("Choose difficulty", selection: $vm.difficulty) {
                        ForEach(Difficulty.allCases) { difficulty in
                            Text(difficulty.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                HStack {
                    NavigationLink("Start Game") {
                        PlayingView(vm: vm)
                    }
                    .foregroundColor(.blue)
                }
            }
            .navigationTitle("MULTIPLY")
            .onDisappear {
                vm.startGame()
            }
            .onAppear(perform: vm.resetVals)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
