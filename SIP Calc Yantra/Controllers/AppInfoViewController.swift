//
//  AppInfoViewController.swift
//  SIP Calc Yantra
//
//  Created by Dinesh Sharma on 31/03/23.
//

import UIKit

class AppInfoViewController: UIViewController {
    
    @IBOutlet weak var lblInfo: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        lblInfo.text = """
        SIP - Systematic Investment Plan is a great way to invest money.
        This app lets you calculate your Invested amount as well as your resulting amount at the end of your inveatments.
        How does it actually work?
        First enter amount which you can  invest every single month, then Enter number of years you want to invest, Remember that the more the number of years, the more the returns. Now Enter your expected rate of return - This is usually 12-14% for an index fund and may very depend on a parricular mutual fund.
        By clicking on Calculate button It will return you invested amount and the compunded interest added in all these years to rhis investmwnt.
        Ckech this Out!
        """
        
    }
 
}
