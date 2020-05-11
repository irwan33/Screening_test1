//
//  ScreenFourCollectionViewCell.swift
//  Suitmedia
//
//  Created by irwan on 10/05/20.
//  Copyright © 2020 irwan. All rights reserved.
//

import UIKit

class ScreenFourCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var avatarImage: UIImageView! {
        didSet {
            avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
            avatarImage.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    class func nib() -> UINib {
        return UINib(nibName: "ScreenFourCollectionViewCell", bundle: nil)
    }
}
