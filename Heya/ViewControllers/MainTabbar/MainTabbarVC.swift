//
//  MainTabbarVC.swift
//  Heya
//
//  Created by TrungNV on 10/7/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import UIKit

class MainTabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initTabs()
    }
    
    func initTabs() {
        let homeVC = initVCForTabbar(type: HomeVC.self, vcStr: "HomeVC", title: "Home", icon: UIImage())
        let historyVC = initVCForTabbar(type: HistoryVC.self, vcStr: "HistoryVC", title: "History", icon: UIImage())
        let messageVC = initVCForTabbar(type: MessageVC.self, vcStr: "MessageVC", title: "Message", icon: UIImage())
        let settingVC = initVCForTabbar(type: SettingVC.self, vcStr: "SettingVC", title: "Setting", icon: UIImage())
        
        self.setViewControllers([homeVC!, historyVC!, messageVC!, settingVC!], animated: true)
    }

}
