//
//  SplashViewController.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 14.04.2022.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var appLogoImageView: UIImageView!
    @IBOutlet weak var loveTextLabel: UILabel!
    @IBOutlet weak var bottomTextContraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splashViewAnimationTrigger()
    }
    
    
    private func splashViewAnimationTrigger() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.fireSplashViewAnimation()
        }
    }
    
    private func startApp() {
        let moviesVC = MainViewBuilder.build()
        UIApplication.shared.windows.first?.rootViewController = moviesVC
        UIApplication.shared.windows.first?.makeKeyAndVisible()


    }
    
    private func fireSplashViewAnimation() {
        self.bottomTextContraint.constant = 3

        UIView.animate(withDuration: 0.8,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.4),  // yay sonme orani, arttikca yanip sonme artar
            initialSpringVelocity: CGFloat(5.0),    // yay hizi, arttikca hizlanir
            options: .curveEaseIn,
            animations: {
            self.appLogoImageView.isHidden = false
            self.view.layoutIfNeeded()
        }) { [weak self] _ in
            self?.startApp()
        }
    }
}
