//
//  ViewController.swift
//  Firebase_Demo
//
//  Created by Third Rock Techkno on 11/07/20.
//  Copyright © 2020 Third Rock Techkno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signInButtonView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configButtonLayout()
    }
    
    func configButtonLayout() {
        signInButtonView.clipsToBounds = true
        signInButton.layer.cornerRadius = signInButton.frame.height / 2
         let gradientLayer:CAGradientLayer = CAGradientLayer()
         gradientLayer.frame.size = signInButton.frame.size
        gradientLayer.cornerRadius = signInButton.frame.height / 2
        let aquaColor = UIColor(red: 0, green: 207, blue: 244, alpha: 1)
        let blueColor = UIColor(red: 0, green: 121, blue: 244, alpha: 1)
        gradientLayer.colors =
            [ blueColor.withAlphaComponent(0.9).cgColor,aquaColor]
         signInButton.layer.addSublayer(gradientLayer)
    }


}

