//
//  AppUtils.swift
//  Heya
//
//  Created by TrungNV on 10/12/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import Foundation
import UIKit

class AppUtils {
    static func showLoadingInViewController(viewController: BaseViewController){
        if viewController.loadingView != nil{
            return
        }
        
        viewController.loadingView = LoadingView(frame: viewController.view.frame)
        viewController.loadingView?.alpha = 0.01
        viewController.view.addSubview(viewController.loadingView!)
        UIView.animate(withDuration: 0.2) {
            viewController.loadingView?.alpha = 1
        }
    }
    
    static func removeLoadingInViewController(viewController: BaseViewController){
        if let loadView = viewController.loadingView{
            loadView.removeFromSuperview()
        }
    }
    
    static func showLoadingInMainTabbar(){
        MainTabbarVC.showLoading()
    }
    
    static func removeLoadingInMainTabbar(){
        MainTabbarVC.removeLoading()
    }
}
