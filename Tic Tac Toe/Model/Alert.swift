//
//  Alert.swift
//  Tic Tac Toe
//
//  Created by Dambar Bista on 2/10/22.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let buttonTitle: Text
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("You win"), message: Text("You are smart. You beat your own AI."),
                             buttonTitle: Text("Hell yeah"))
    
    static let computerWin = AlertItem(title: Text("You lost"), message: Text("You programmed a super AI."),
                                buttonTitle: Text("Rematch"))
    
    static let draw = AlertItem(title: Text("Draw"), message: Text("What a battle of wits we have here..."),
                                buttonTitle: Text("Try again!"))
}


