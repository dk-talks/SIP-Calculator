//
//  ViewController.swift
//  SIP Calc Yantra
//
//  Created by Dinesh Sharma on 31/03/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(defaults.bool(forKey: "isLaunched")) {
            if let  homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeViewController {

                self.navigationController?.pushViewController(homeVC, animated: false)

            }
        }
    }
    
    
    @IBAction func btnNext(_ sender: Any) {
        defaults.set(true, forKey: "isLaunched")
    }
    

}

