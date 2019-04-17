//
//  InputView.swift
//  LadderGame
//
//  Created by 이진영 on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputQuestion: String {
    case playerQuestion = "참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)"
    case ladderHeightQuestion = "최대 사다리 높이는 몇 개인가요?"
}

enum InputError: Error {
    case invalidInput
    case invalidPlayerCount
    case invalidPlayerName
    case invalidLadderHeight
}

extension InputError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidInput:
            return "입력 오류"
        case .invalidPlayerCount:
            return "사람 수 오류"
        case .invalidPlayerName:
            return "사람 이름 오류"
        case .invalidLadderHeight:
            return "사다리 높이 오류"
        }
    }
}

struct InputView {
    private(set) var players: [LadderPlayer] = []
    private(set) var ladderHeight: Int = 0
    
    private func ask(question: InputQuestion) throws -> String {
        print(question.rawValue)
        guard let answer = readLine() else { throw InputError.invalidInput }
        
        return answer
    }
    
    private mutating func inputPlayers() throws {
        let players = try ask(question: .playerQuestion).split(separator: ",")
        
        if players.count < 2 { throw InputError.invalidPlayerCount }
        
        for player in players {
            self.players.append(try LadderPlayer(name: String(player)))
        }
    }
    
    private mutating func inputLadderHeight() throws {
        guard let ladderHeight = Int(try ask(question: .ladderHeightQuestion)), ladderHeight > 0 else { throw InputError.invalidLadderHeight }
        
        self.ladderHeight = ladderHeight
    }
    
    init() throws {
        players = []
        ladderHeight = 0
        
        try inputPlayers()
        try inputLadderHeight()
    }
}
