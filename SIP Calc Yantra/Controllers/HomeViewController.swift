//
//  HomeViewController.swift
//  SIP Calc Yantra
//
//  Created by Dinesh Sharma on 31/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var sipLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        sipLogo.layer.cornerRadius = 100
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
}
