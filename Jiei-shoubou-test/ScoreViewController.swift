//
//  ScoreViewController.swift
//  Jiei-shoubou-test
//
//  Created by ny on 2021/03/27.
//

import UIKit
class ScoreViewController: UIViewController {
    @IBOutlet var Resultlavel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    var correct = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if  correct > 20  {
            Resultlavel.text = "すばらしい！合格圏内です！"
        } else if correct > 14 {
            Resultlavel.text = "惜しい!あと少し！"
        } else {
            Resultlavel.text = "もう少し勉強が必要です"
        }
        scoreLabel.text = "\(correct)問正解!"
    }
    @IBAction func shareButtonAction(_ sender: Any) {
        let activityItems = ["\(correct)問正解しました！", "#自衛消防技術試験アプリ"]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityVC, animated: true)
    }
    
    @IBAction func toTopButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
}
