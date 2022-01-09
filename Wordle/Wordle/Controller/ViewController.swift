//
//  ViewController.swift
//  Wordle
//
//  Created by Angelina Shao on 1/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FirstStackView: UIStackView!
    @IBOutlet weak var SecondStackView: UIStackView!
    @IBOutlet weak var ThirdStackView: UIStackView!
    @IBOutlet weak var FourthStackView: UIStackView!
    @IBOutlet weak var FifthStackView: UIStackView!
    @IBOutlet weak var SixthStackView: UIStackView!
    @IBOutlet weak var ParentStackView: UIStackView!
    
    @IBOutlet weak var QPStackView: UIStackView!
    @IBOutlet weak var ALStackView: UIStackView!
    @IBOutlet weak var ZMStackView: UIStackView!
    
    @IBOutlet var KeyboardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for stackview in ParentStackView.arrangedSubviews {
            let children = stackview as! UIStackView
            for subview in children.arrangedSubviews {
                let label = subview as! UILabel
                label.text = ""
                label.layer.borderWidth = 1.0
                label.layer.borderColor = UIColor(red: 58.0/255.0, green: 58.0/255.0, blue: 60.0/255.0, alpha: 1.0).cgColor
            }
        }
        for QPkeys in QPStackView.arrangedSubviews {
            let letters = QPkeys as! UIButton
            letters.layer.cornerRadius = 5
        }
        for ALkeys in ALStackView.arrangedSubviews {
            let letters = ALkeys as! UIButton
            letters.layer.cornerRadius = 5
        }
        for ZMkeys in ZMStackView.arrangedSubviews {
            let letters = ZMkeys as! UIButton
            letters.layer.cornerRadius = 5
        }
    }
    
    

}

