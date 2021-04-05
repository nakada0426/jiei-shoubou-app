//
//  ScoreViewController.swift
//  Jiei-shoubou-test
//
//  Created by ny on 2021/03/27.
//

import UIKit


class ScoreViewController: UIViewController {
  
    
    @IBOutlet var commentlavel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    var correct = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if ( correct > 10 ) {
            commentlavel.text = "すばらしい!"
        } else {
            commentlavel.text = "残念！"
        }

        scoreLabel.text = "\(correct)問正解!"
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func shareButtonAction(_ sender: Any) {
        let activityItems = ["\(correct)問正解しました！", "#自衛消防技術試験アプリ"]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityVC, animated: true)
    }
    
    @IBAction func toTopButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     */
}
