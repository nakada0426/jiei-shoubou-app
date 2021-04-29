//
//  SelectLevelViewController.swift
//  Jiei-shoubou-test
//
//  Created by ny on 2021/03/27.
//

import UIKit


class SelectLevelViewController: UIViewController {
    
    var selectTag = 0
    @IBOutlet var Button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quizVC = segue.destination as! QuizViewController
        quizVC.selectLevel = selectTag
    }
    
    
    @IBAction func levelButtonAction(sender: UIButton) {
        print(sender.tag)
        selectTag = sender.tag
        performSegue(withIdentifier: "toQuizVC", sender: nil)
    }
    
    @IBAction func Button1(_ sender: Any) {
        let dialog = UIAlertController(title: "試験ガイド", message: "メッセージ", preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(dialog, animated: true, completion: nil)

        Button1.contentHorizontalAlignment = .left
        
    }
    
}
