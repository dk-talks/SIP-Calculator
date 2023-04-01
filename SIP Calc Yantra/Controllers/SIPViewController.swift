//
//  SIPViewController.swift
//  SIP Calc Yantra
//
//  Created by Dinesh Sharma on 31/03/23.
//

import UIKit

class SIPViewController: UIViewController {
  
    let formatter = NumberFormatter()
    
    @IBOutlet weak var perMonthTF: UITextField!
    @IBOutlet weak var sliderOfAmount: UISlider!
    
    @IBOutlet weak var txtFieldYear: UITextField!
    
    @IBOutlet weak var sliderOfYear: UISlider!
    
    @IBOutlet weak var txtFieldRate: UITextField!
    
    @IBOutlet weak var sliderOfRate: UISlider!
    
    @IBOutlet weak var btnCalc: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        formatter.numberStyle = .currency
        formatter.currencyCode = "INR"
        let locale = Locale(identifier: "en_IN")
        formatter.locale = locale

        txtFieldYear.text = "10"
        txtFieldRate.text = "12"
        perMonthTF.text = "500"
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    
    
    @IBAction func amountSliderValueChanged(_ sender: UISlider) {
        perMonthTF.text = String(Int(sender.value))
    }
    
    @IBAction func yearSliderValueChanged(_ sender: UISlider) {
        txtFieldYear.text = String(Int(sender.value))
    }
    
    @IBAction func rateSliderValueChanged(_ sender: UISlider) {
        txtFieldRate.text = String(Int(sender.value))
    }
    
    @IBAction func btnCalcPressed(_ sender: Any) {

        guard let sipAmount = Double(perMonthTF.text ?? ""),
              let rate = Double(txtFieldRate.text ?? ""),
              let time = Double(txtFieldYear.text ?? "") else {
            return
        }
        
        let n = 12.0
        let r = rate/100.0
        
        let base = 1 + (r/n)
        let exponent = n * time
        let power = pow(base, exponent)
        let numerator = power - 1
        let denominator = r/n
        let maturityAmount = sipAmount * (numerator / denominator)
        let actualMount = sipAmount * 12 * time
        
        if let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "resultVC") as? ResultViewController {
            resultVC.actualAmount = formatter.string(from: NSNumber(value: Int(actualMount)))
            resultVC.maturityAmount = formatter.string(from: NSNumber(value: Int(maturityAmount)))
            resultVC.sipAmount = formatter.string(from: NSNumber(value: Int(sipAmount)))
            resultVC.time = "\(Int(time))"
            resultVC.rate = "\(Int(rate))"
            self.navigationController?.pushViewController(resultVC, animated: true)
        }
        
        
//        maturityAmountLabel.text = formatter.string(from: NSNumber(value: maturityAmount))
        
        
        
        
    }
    
    
}


