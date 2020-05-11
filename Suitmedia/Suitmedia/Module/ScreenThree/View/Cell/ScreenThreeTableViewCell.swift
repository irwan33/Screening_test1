//
//  ScreenThreeTableViewCell.swift
//  Suitmedia
//
//  Created by irwan on 10/05/20.
//  Copyright © 2020 irwan. All rights reserved.
//

import UIKit

class ScreenThreeTableViewCell: UITableViewCell {

    let borderColor : UIColor = UIColor( red: 204.0, green: 204.0, blue:204.0, alpha: 1.0 )
    @IBOutlet weak var imageThumb: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var subView: UIView! {
        didSet {
            subView.layer.borderColor = borderColor.cgColor
            subView.layer.shadowColor = UIColor.black.cgColor
            subView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            subView.layer.shadowOpacity = 0.2
            subView.layer.shadowRadius = 15.0
            subView.layer.cornerRadius = 15.0
            subView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var descLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func nib() -> UINib {
        return UINib(nibName: "ScreenThreeTableViewCell", bundle: nil)
    }
    
}
