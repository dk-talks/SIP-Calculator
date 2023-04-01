//
//  ResultViewController.swift
//  SIP Calc Yantra
//
//  Created by Dinesh Sharma on 31/03/23.
//

import UIKit

class ResultViewController: UIViewController {

    var actualAmount: String?
    var maturityAmount: String?
    var sipAmount: String?
    var time: String?
    var rate: String?
    
    
    @IBOutlet weak var lblActualAmount: UILabel!
    
    @IBOutlet weak var lblMaturityAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblActualAmount.text = actualAmount
        lblMaturityAmount.text = maturityAmount
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        let shareButton = UIBarButtonItem(title: "Share", style: .done, target: self, action: #selector(btnShareTapped))
        
        self.navigationItem.rightBarButtonItem = shareButton

        
    }
    
    
    @IBAction func btnDetailTapped(_ sender: Any) {
        
        if let meaningVC = self.storyboard?.instantiateViewController(withIdentifier: "MeaningVC") as? MeaningViewController {
            meaningVC.rate = rate
            meaningVC.time = time
            meaningVC.sipAmount = sipAmount
            meaningVC.maturityAmount = maturityAmount
            meaningVC.actualAmount = actualAmount
            
            self.navigationController?.pushViewController(meaningVC, animated: true)
        }
        
        
    }
    
    @objc func btnShareTapped() {
        
        let image = self.captureScreen()
        let shareController: UIActivityViewController = {
            let activities: [Any] = [image]
            let controller = UIActivityViewController(activityItems: activities, applicationActivities: nil)
            return controller}()
        self.present(shareController, animated: true, completion: nil)
        
    }
    
    func captureScreen() -> UIImage {
           var window: UIWindow? = UIApplication.shared.keyWindow
           window = UIApplication.shared.windows[0] as? UIWindow
           UIGraphicsBeginImageContextWithOptions(window!.frame.size, window!.isOpaque, 0.0)
           window!.layer.render(in: UIGraphicsGetCurrentContext()!)
           let image = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()
           return image!;
    }
    

    
}
