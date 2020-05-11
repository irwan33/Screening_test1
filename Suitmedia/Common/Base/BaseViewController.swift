//
//  BaseViewController.swift
//  Suitmedia
//
//  Created by irwan on 10/05/20.
//  Copyright © 2020 irwan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func keyboardshow() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

    }
    
    
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                 action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func hideKeyboard() {
        view.endEditing(true)
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    func setDefaultToolbar(dismissTabBar: Selector?){
        let image = UIImage(named: "ic_back_white")?.withRenderingMode(.alwaysOriginal)
        let leftBarItem = UIBarButtonItem(image: image, style: .plain, target: self, action: dismissTabBar)
        self.navigationItem.leftBarButtonItem = leftBarItem
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.backgroundColor = UIColor.orange
        self.navigationController?.navigationBar.tintColor = UIColor.gray
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
    }
    
    func showleftMenu(menu1: String, menu2: String) {
        let menuBarButtonItem = UIBarButtonItem(image: UIImage(named: menu2), style: .plain, target: self, action: #selector(openMenuController))
        let menuBarButtonItem2 = UIBarButtonItem(image: UIImage(named: menu1), style: .plain, target: self, action: #selector(openMenuController))
        menuBarButtonItem.tintColor = UIColor.white
        menuBarButtonItem2.tintColor = UIColor.white
        navigationItem.rightBarButtonItems = [menuBarButtonItem, menuBarButtonItem2]
    }
    
    func showAlertAction(title: String, message: String){
        hideKeyboard()
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func openMenuController(){}
}
