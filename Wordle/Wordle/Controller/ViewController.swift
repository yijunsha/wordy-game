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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for stackview in ParentStackView.arrangedSubviews {
            let children = stackview as! UIStackView
            for subview in children.arrangedSubviews {
                let label = subview as! UILabel
                label.text = ""
                label.layer.borderWidth = 1.0
            }
        }
    }
    

}

