//
//  ScreenFourViewController.swift
//  Suitmedia
//
//  Created by irwan on 10/05/20.
//  Copyright © 2020 irwan. All rights reserved.
//

import UIKit
import SDWebImage
class ScreenFourViewController: BaseViewController {

    var estimateWidth = 160.0
    var cellMarginSize = 20.0
    var data : [GetDataUserModel] = []
   
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getListUser()
        setupNavigationBar()
        showleftMenu(menu1: "ic_search_white.png", menu2: "ic_list_view")
        self.title = "GUEST";
        self.collectionView.register(ScreenFourCollectionViewCell.nib(), forCellWithReuseIdentifier: "cell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.setupGridView()
        
    }

    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setupGridView()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
   
    
    func setupNavigationBar(){
        self.title = "EVENT";
        self.setDefaultToolbar(dismissTabBar: #selector(dismissTabBar))
    }
    
    @objc private func dismissTabBar () {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
  
    
    func getListUser() {
       
        UserList.shared.getListUser(){ result, error in
               if error != nil {
               }else{
                   guard let data = result else { return }
                   
                   do {
                       let dataObject = try JSONDecoder().decode(UserModel.self, from: data)
                       if let data = dataObject.data{
                           self.data.append(contentsOf: data)
                            print(self.data)
                        
                       }
                   
                   
                        self.collectionView.reloadData()
                   }catch{
                       print(error)
                   }
               }
           }
       }
    
    @objc func tapSelector(sender: CustomTapGestureRecognizer) {
           print(sender.iD!)
           
           var phone : String?
           if sender.iD! % 2 == 0 {
               phone = "BlackBerry"
           } else if sender.iD! % 3 == 0 {
               phone = "BlackBerry"
           } else if sender.iD! % 2 == 0 && sender.iD! % 3 == 0 {
               phone = "iOS"
           } else {
               phone = "feature phones"
           }
           
           let refreshAlert = UIAlertController(title: "Phone", message: "\(phone!)", preferredStyle: UIAlertController.Style.alert)
           
           refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            NotificationCenter.default.post(name: Notification.Name("guestNotification"),
            object: nil,
            userInfo:["guest": sender.userName!])
            self.dismissTabBar()
               print("\(sender.userName!)")
           }))
           
           refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
               self.dismiss(animated: false, completion: nil)
           }))
           
           present(refreshAlert, animated: true, completion: nil)
           
       }
}

extension ScreenFourViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! ScreenFourCollectionViewCell
        
        let tap = CustomTapGestureRecognizer(target: self, action: #selector(tapSelector(sender:)))
        tap.iD = data[indexPath.row].id
        tap.userName = "\(data[indexPath.row].first_name!)"
        cell.MainView.addGestureRecognizer(tap)
        cell.nameLbl.text = "\(data[indexPath.row].first_name!)  \(data[indexPath.row].last_name!)"
        
        if let url = URL(string: "\(data[indexPath.row].avatar!)") {
            cell.avatarImage.sd_setImage(with: url, completed: nil)
        }
        return cell
    }
    
 
}

extension ScreenFourViewController :  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
    }
    
    func calculateWith() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
}
class CustomTapGestureRecognizer: UITapGestureRecognizer {
    var iD : Int?
    var userName : String?
}
