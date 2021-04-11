//
//  ScoreViewController.swift
//  Jiei-shoubou-test
//
//  Created by ny on 2021/03/27.
//
import UIKit
import GoogleMobileAds
class ScoreViewController: UIViewController , GADFullScreenContentDelegate {
    @IBOutlet var resultlavel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    var correct = 0
    private var interstitial: GADInterstitialAd!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
                               request: request,
                               completionHandler: { [self] ad, error in
                                if let error = error {
                                    print("Failed 失敗です　to load interstitial ad with error: \(error.localizedDescription)")
                                    return
                                }
                                interstitial = ad
                                interstitial?.fullScreenContentDelegate = self
                               }
        )
        if correct > 20  {
            resultlavel.text = "すばらしい！合格圏内です！"
        } else if correct > 14 {
            resultlavel.text = "惜しい!あと少し！"
        } else {
            resultlavel.text = "もう少し勉強が必要です"
        }
        scoreLabel.text = "\(correct)問正解!"
    }
    
    func createInterAd(){
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
                               request: request,
                               completionHandler: { [self] ad, error in
                                if let error = error {
                                    print("Failed 失敗です　to load interstitial ad with error: \(error.localizedDescription)")
                                    return
                                }
                                interstitial = ad
                                interstitial?.fullScreenContentDelegate = self
                               }
        )
    }

    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("広告表示の失敗　Ad did fail to present full screen content.")
    }
    func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("広告表示の成功　Ad did present full screen content.")
    }
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("広告表示を消す　Ad did dismiss full screen content.")
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        let activityItems = ["\(correct)問正解しました！", "#自衛消防技術試験アプリ"]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityVC, animated: true)
    }
    
    @IBAction func toTopButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
        if interstitial != nil {
          interstitial.present(fromRootViewController: self)
        } else {
          print("Ad wasn't ready")
        }

    }

}
