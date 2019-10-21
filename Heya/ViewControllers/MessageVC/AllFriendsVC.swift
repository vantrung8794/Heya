//
//  AllFriendsVC.swift
//  Heya
//
//  Created by TrungNV on 10/15/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import Foundation
import UIKit

class AllFriendsVC: UIViewController {

    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var friendsTableView: UITableView!
    
    let lstFriend = HomeVC.initUsers()
    var lstSearch = [UserBO]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initData()
    }
    
    func initData(){
        for user in lstFriend{
            lstSearch.append(user.clone())
        }
    }
    
    func initTable() {
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
        friendsTableView.register(UINib(nibName: "FriendCell", bundle: nil), forCellReuseIdentifier: "FriendCell")
    }
    
    func initUI(){
        initTable()
        tfSearch.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }

}

// MARK: - TableViewDelegates and datasources
extension AllFriendsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lstSearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendsTableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell
        cell?.configCell(lstSearch[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension AllFriendsVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.view.endEditing(true   )
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let searchStr = textField.text?.trim()
        lstSearch.removeAll()
        
        if searchStr == ""{
            initData()
        }else{
            lstSearch = lstFriend.filter{$0.name.value().lowercased().range(of:searchStr!.lowercased()) != nil}
        }
        
        friendsTableView.reloadData()
    }
}
