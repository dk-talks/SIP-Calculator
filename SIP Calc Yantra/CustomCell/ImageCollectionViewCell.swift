//
//  ImageCollectionViewCell.swift
//  SIP Calc Yantra
//
//  Created by Dinesh Sharma on 01/04/23.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        layer.borderColor = UIColor.systemPink.cgColor
        layer.borderWidth = 10
        layer.cornerRadius = 10
        layer.masksToBounds = true
        //layer.cornerRadius = bounds.height/1.5
    }
    
}
