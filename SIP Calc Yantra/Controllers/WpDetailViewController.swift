//
//  WpDetailViewController.swift
//  SIP Calc Yantra
//
//  Created by Dinesh Sharma on 01/04/23.
//

import UIKit

class WpDetailViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var btnShare: UIButton!
    var img1 : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Share Wallpaper"
        // Do any additional setup after loading the view.
       
        self.btnShare.addTarget(self, action: #selector(onClickShare), for: .touchUpInside)
        
        
        self.imgView.image = img1
    }
    @objc func onClickShare() {
        
     let img =  img1
        
        let vc = UIActivityViewController(activityItems: [img], applicationActivities: nil)
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let popoverController = vc.popoverPresentationController {
                popoverController.sourceView = self.view
            }
        }
        present(vc, animated: true)
    }
    
    @IBAction func btnShareclicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
