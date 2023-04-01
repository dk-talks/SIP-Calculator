//
//  KnowledgeViewController.swift
//  SIP Calc Yantra
//
//  Created by Dinesh Sharma on 31/03/23.
//

import UIKit

class KnowledgeViewController: UIViewController {

    @IBOutlet weak var textKnowledge: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textKnowledge.text = """
        SIP, or Systematic Investment Plan, is a popular investment option in India where investors invest a fixed amount of money at regular intervals in a mutual fund scheme. It is a disciplined approach to investing, where investors can start with a small amount and gradually increase their investment over time.

        One of the key advantages of SIP is that it helps investors avoid the temptation to time the market. Instead of trying to predict the market and investing a lump sum amount, investors can invest a fixed amount of money at regular intervals, irrespective of market conditions. This helps in averaging out the cost of investment over time and reduces the risk of losses due to market volatility.

        SIPs are also very flexible and can be started with as little as Rs. 500 per month. Investors can choose to invest on a monthly, quarterly or semi-annual basis, depending on their convenience. Moreover, SIPs are available across a wide range of mutual fund schemes, including equity, debt, and hybrid funds, providing investors with ample investment options.
        
        SIP is a great way for investors to take advantage of the power of compounding, as the returns earned on their investment are reinvested back into the fund. Over time, this can lead to a significant increase in the value of their investment.
        """
        
    }
    

   

}
