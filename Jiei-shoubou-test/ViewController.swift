//
//  ViewController.swift
//  Jiei-shoubou-test
//
//  Created by ny on 2021/03/27.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.white.cgColor
    }
    
    
}

