//
//  SecretWord.swift
//  Wordle
//
//  Created by Priyank Aranke on 1/8/22.
//

import Foundation

class SecretWordStore : NSObject {
    
    static let dictionary = Dictionary()
    private var secret: String
    
    override init() {
        self.secret = SecretWordStore.dictionary.nextWord
    }
    
    func checkSolution(guess: String) -> Array<Result> {
        var results: [Result] = []
        for idx in (0...4) {
            results.append(checkLetter(guess.lowercased(), idx))
        }
        return results
    }
    
    func isPerfectMatch(guess: String) -> Bool {
        return secret == guess.lowercased()
    }
    
    func isValid(guess: String) -> Bool {
        return SecretWordStore.dictionary.isValid(guess.lowercased())
    }
    
    func readSecret() -> String {
        return secret
    }
    
    func reset() {
        secret = SecretWordStore.dictionary.nextWord
    }
    
    private func checkLetter(_ guess: String, _ idx: Int) -> Result {
        // Perfect match
        if (guess[idx] == secret[idx]) {
            return Result.green
        }
        // Partial match
        if (secret.contains(guess[idx])) {
            return Result.yellow
        }
        
        // No match
        return Result.grey
    }
}

enum Result {
    case green, yellow, grey
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
