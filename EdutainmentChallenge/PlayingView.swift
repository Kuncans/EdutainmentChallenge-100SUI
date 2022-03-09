//
//  PlayingView.swift
//  EdutainmentChallenge
//
//  Created by Duncan Kent on 09/03/2022.
//

import SwiftUI

struct PlayingView: View {
    
    @ObservedObject var vm: GameViewModel
    
    var body: some View {
        if vm.currentQuestion == nil {
            ProgressView()
        } else {
            VStack {
                Text("Score: \(vm.score)")
                Text(vm.currentQuestion?.question ?? "0 x 0")
                TextField("Answer", text: $vm.answer)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        vm.checkAnswer()
                    }
                
                Spacer()
            }
            .padding(.horizontal)
            .font(.title)
        }
       

    }
        
}

struct PlayingView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingView(vm: GameViewModel())
    }
}
