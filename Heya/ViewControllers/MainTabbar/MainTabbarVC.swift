//
//  MainTabbarVC.swift
//  Heya
//
//  Created by TrungNV on 10/7/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import UIKit

class MainTabbarVC: UITabBarController {
    
    static var viewOfMainTabbar: UIView?
    static var loadingView: LoadingView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTabs()
        MainTabbarVC.viewOfMainTabbar = self.view
    }
    
    func initTabs() {
        let homeVC = initVCForTabbar(type: HomeVC.self, vcStr: "HomeVC", title: "Home", icon: UIImage(named: "ic_home_25")!)
        let historyVC = initVCForTabbar(type: HistoryVC.self, vcStr: "HistoryVC", title: "History", icon: UIImage(named: "ic_history_25")!)
        let messageVC = initVCForTabbar(type: MessageVC.self, vcStr: "MessageVC", title: "Message", icon: UIImage(named: "ic_message_25")!)
        let settingVC = initVCForTabbar(type: SettingVC.self, vcStr: "SettingVC", title: "Setting", icon: UIImage(named: "ic_setting_25")!)
        
        self.setViewControllers([homeVC!, historyVC!, messageVC!, settingVC!], animated: true)
    }
    
    // Loading View
    static func showLoading(){
        if loadingView != nil {
            return
        }
        
        loadingView = LoadingView(frame: MainTabbarVC.viewOfMainTabbar!.frame)
        loadingView?.alpha = 0.01
        MainTabbarVC.viewOfMainTabbar!.addSubview(loadingView!)
        UIView.animate(withDuration: 0.2) {
            loadingView?.alpha = 1
        }
    }
    
    static func removeLoading(){
        if let loadView = loadingView{
            loadView.removeFromSuperview()
        }
    }
}

