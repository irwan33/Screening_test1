//
//  ScreenOneViewController.swift
//  Suitmedia
//
//  Created by irwan on 10/05/20.
//  Copyright © 2020 irwan. All rights reserved.
//

import UIKit

class ScreenOneViewController: BaseViewController {
    let borderColor : UIColor = UIColor( red: 204.0, green: 204.0, blue:204.0, alpha: 1.0 )
    @IBOutlet weak var loginView: UIView! {
        didSet{
            loginView.layer.borderColor = borderColor.cgColor
            loginView.layer.shadowColor = UIColor.black.cgColor
            loginView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            loginView.layer.shadowOpacity = 0.2
            loginView.layer.shadowRadius = 15.0
            loginView.layer.cornerRadius = 15.0
        }
    }
    
    @IBOutlet weak var UserName: UITextField! {
        didSet{
            UserName.layer.cornerRadius = 22.0
            UserName.layer.borderWidth = 1
            UserName.layer.borderColor = borderColor.cgColor
            UserName.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var palindromeText: UITextField! {
        didSet{
            palindromeText.layer.cornerRadius = 22.0
            palindromeText.layer.borderWidth = 1
            palindromeText.layer.borderColor = borderColor.cgColor
            palindromeText.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 22.0
        }
    }
    @IBOutlet weak var checkButton: UIButton! {
        didSet {
            checkButton.layer.cornerRadius = 22.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardshow()
        hideKeyboardWhenTappedAround()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func btnNextPressed(_ sender: Any) {
        let vc = ScreenTwoViewController()
        vc.user = self.UserName.text
        self.navigationController?.pushViewController(vc, animated: false)
       }
    
    
  
}
