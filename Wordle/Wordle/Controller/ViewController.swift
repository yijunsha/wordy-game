//
//  ViewController.swift
//  Wordle
//
//  Created by Angelina Shao on 1/8/22.
//

import UIKit

let BORDER_COLOR = UIColor(red: 58.0/255.0, green: 58.0/255.0, blue: 60.0/255.0, alpha: 1.0).cgColor
let BORDER_WIDTH = CGFloat(1.0)
let LETTER_RADIUS = CGFloat(5.0)

class ViewController: UIViewController {

    @IBOutlet weak var ParentStackView: UIStackView!
    @IBOutlet weak var KeyboardStackView: UIStackView!
    
    var guessAttempt = 0
    var wordIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for stackview in ParentStackView.arrangedSubviews {
            let children = stackview as! UIStackView
            for subview in children.arrangedSubviews {
                let label = subview as! UILabel
                initializeLabel(label)
            }
        }
        for keyboard in KeyboardStackView.arrangedSubviews {
            let children = keyboard as! UIStackView
            for keys in children.arrangedSubviews {
                let letters = keys as! UIButton
                letters.layer.cornerRadius = LETTER_RADIUS
            }
        }
        
    }
    
    func initializeLabel(_ label: UILabel) {
        label.text = ""
        label.layer.borderWidth = BORDER_WIDTH
        label.layer.borderColor = BORDER_COLOR
    }
    
    @IBAction func UserDidTapLetter(_ sender: Any) {
        guard let button = sender as? UIButton else {
                return
            }
        switch button.tag {
        case 1:
            checkValid("Q")
        case 2:
            checkValid("W")
        case 3:
            checkValid("E")
        case 4:
            checkValid("R")
        case 5:
            checkValid("T")
        case 6:
            checkValid("Y")
        case 7:
            checkValid("U")
        case 8:
            checkValid("I")
        case 9:
            checkValid("O")
        case 10:
            checkValid("P")
        case 11:
            checkValid("A")
        case 12:
            checkValid("S")
        case 13:
            checkValid("D")
        case 14:
            checkValid("F")
        case 15:
            checkValid("G")
        case 16:
            checkValid("H")
        case 17:
            checkValid("J")
        case 18:
            checkValid("K")
        case 19:
            checkValid("L")
        case 20:
            enterPressed()
        case 21:
            checkValid("Z")
        case 22:
            checkValid("X")
        case 23:
            checkValid("C")
        case 24:
            checkValid("V")
        case 25:
            checkValid("B")
        case 26:
            checkValid("N")
        case 27:
            checkValid("M")
        case 28:
            deletePressed()
        default:
            print("Unknown")
            return
        }
    }
    
    func checkValid(_ letter: String) {
        if wordIndex > 4 {
            return
        }
        else {
            displayLetter(letter)
            wordIndex += 1
        }
    }
    
    func displayLetter(_ letter: String) {
        let currentRow = ParentStackView.arrangedSubviews[guessAttempt] as! UIStackView
        let currentBox = currentRow.arrangedSubviews[wordIndex] as! UILabel
        currentBox.text = letter
    }
    
    func enterPressed() {
        if wordIndex > 4 {
            if guessAttempt >= 6 {
                return
            }
            getWord()
            guessAttempt += 1
            wordIndex = 0
        }
    }
    
    func deletePressed() {
        if wordIndex > 0 {
            wordIndex -= 1
            displayLetter("")
        }
    }
    
    func getWord() -> String {
        let currentRow = ParentStackView.arrangedSubviews[guessAttempt] as! UIStackView
        var currentWord = ""
        for subview in currentRow.arrangedSubviews {
            let label = subview as! UILabel
            currentWord.append(label.text ?? "")
        }
        print(currentWord)
        return currentWord
    }
}

