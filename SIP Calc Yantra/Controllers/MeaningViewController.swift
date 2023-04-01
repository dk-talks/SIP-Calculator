//
//  MeaningViewController.swift
//  SIP Calc Yantra
//
//  Created by Dinesh Sharma on 31/03/23.
//

import UIKit

class MeaningViewController: UIViewController {
    
    var actualAmount: String?
    var maturityAmount: String?
    var sipAmount: String?
    var time: String?
    var rate: String?
    
    
    @IBOutlet weak var lblMeaning: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let sipAmount = sipAmount,
              let time = time,
              let rate = rate,
              let actualAmount = actualAmount,
              let maturityAmount = maturityAmount else {
                  return
              }
        
        lblMeaning.text = "If you invest \(sipAmount) per month for \(time) years with rate of return \(rate) then your would invest \(actualAmount) and it will become \(maturityAmount)"
        
    }
    

    @IBAction func shareBtn(_ sender: Any) {
        
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
