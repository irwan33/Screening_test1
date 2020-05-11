//
//  ScreenTwoViewController.swift
//  Suitmedia
//
//  Created by irwan on 10/05/20.
//  Copyright © 2020 irwan. All rights reserved.
//

import UIKit

class ScreenTwoViewController: UIViewController {

    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var guestButton: UIButton! {
        didSet {
            guestButton.layer.cornerRadius = 22.0
        }
    }
    @IBOutlet weak var eventButton: UIButton! {
        didSet {
            eventButton.layer.cornerRadius = 22.0
        }
    }
    var user: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usernameLbl.text = user
        addObservers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func addObservers() {
        NotificationCenter.default.addObserver(self,
            selector: #selector(eventMethod),
            name: Notification.Name("eventNotification"),
            object: nil)
        NotificationCenter.default.addObserver(self,
        selector: #selector(guestMethod),
        name: Notification.Name("guestNotification"),
        object: nil)
    }
    
    @objc func eventMethod(_ notification: Notification) {
        let info = notification.userInfo?["event"]  as? String
        if info != nil {
            eventButton.setTitle(info, for: .normal)
        } else {
            eventButton.setTitle("Choose Event", for: .normal)
        }
    }
    
    @objc func guestMethod(_ notification: Notification) {
        let info = notification.userInfo?["guest"] as? String
        if info != nil {
            usernameLbl.text = info
        } else {
            usernameLbl.text = "Guest"
        }
    }
    
    @IBAction func eventButtonPressed(_ sender: Any) {
        let vc = ScreenThreeViewController()
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    @IBAction func guestButtonPressed(_ sender: Any) {
        let vc = ScreenFourViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
 

}
