//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Dambar Bista on 2/9/22.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    LazyVGrid(columns: viewModel.columns, spacing: 5) {
                        ForEach(0..<9) { i in
                            ZStack {
                                let extractedExpr = Circle()
                                extractedExpr
                                    .foregroundColor(.red).opacity(0.5)
                                    .frame(width: geometry.size.width/3 - 15, height: geometry.size.width/3 - 15)
                                Image(systemName: viewModel.moves[i]?.indicator ?? "")
                                    .resizable()
                                    .frame(width: 40, height: 40, alignment: .center)
                                    .foregroundColor(.white)
                            }
                            .onTapGesture {
                                viewModel.processPlayerMove(for: i)
                            }
                            //: ZStack
                        }
                    }
                    Spacer()
                }
                .disabled(viewModel.isGameboardDisabled)
                .padding()
                .alert(item: $viewModel.alertItem) { alertItem in
                    Alert(title: alertItem.title,
                          message: alertItem.message,
                          dismissButton: .default(alertItem.buttonTitle, action: viewModel.resetGame))
                }
                //: VStack
            }
            .navigationTitle("Tic Tac Toe")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

enum Player {
    case human
    case computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
