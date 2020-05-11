//
//  ScreenThreeViewController.swift
//  Suitmedia
//
//  Created by irwan on 10/05/20.
//  Copyright © 2020 irwan. All rights reserved.
//

import UIKit

class ScreenThreeViewController: BaseViewController {

    var eventData = Event.data
    var message : String?
    private var selectedIndex: Int = -1
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        showleftMenu(menu1: "ic_search_white.png", menu2: "ic_map_view.png")
        setupTableView()
    }

    func setupNavigationBar(){
        self.title = "EVENT";
        self.setDefaultToolbar(dismissTabBar: #selector(dismissTabBar))
        
    }
    
    @objc private func dismissTabBar () {
        self.navigationController?.popViewController(animated: true)
    }

}

extension ScreenThreeViewController :  UITableViewDelegate, UITableViewDataSource {
    func setupTableView(){
        tableView.register(ScreenThreeTableViewCell.nib(), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return eventData.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let username = eventData[indexPath.row].name
        NotificationCenter.default.post(name: Notification.Name("eventNotification"),
        object: nil,
        userInfo:["event": username])
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! ScreenThreeTableViewCell
            
            let data = eventData[indexPath.row]
            cell.selectionStyle = .none
            cell.nameLbl.text =  data.name
            cell.descLbl.text = data.subTitle
            cell.dateLbl.text = data.Date
            cell.imageThumb.image = UIImage(named: "\(data.imageEvent)")!
            if selectedIndex == indexPath.row {
                self.message = data.name
            }
            
            return cell
    }
}
