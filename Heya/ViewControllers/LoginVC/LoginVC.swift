//
//  LoginVC.swift
//  Heya
//
//  Created by TrungNV on 10/12/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import UIKit

protocol LoginVCDelegate {
    func didLoginSuccess(loginVC: LoginVC, userName: String, pass passWord: String)
}

class LoginVC: BaseViewController {
    var viewControllers: [UIViewController]!
    var pageViewController: UIPageViewController!
    @IBOutlet weak var loginContainerView: UIView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var subLineView: UIView!
    @IBOutlet weak var btnSignInTab: UIButton!
    @IBOutlet weak var btnSignUpTab: UIButton!
    
    var delegate: LoginVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageController()
        initUI()
    }
    
    // MARK: - Functions
    func initUI(){
        changeTabColor(isLogin: true)
        logoView.setRadius()
        subLineView.setRadius(1.0)
    }
    func setupPageController() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.delegate = self
        
        let signInVC = SignInVC(nibName: "SignInVC", bundle: nil)
        signInVC.didLoginSuccess = { userName, pass in
            self.dismiss(animated: true){
                if let mDelegate = self.delegate{
                    mDelegate.didLoginSuccess(loginVC: self, userName: userName ?? "", pass: pass ?? "")
                }
            }
        }
        
        let signUpVC = SignUpVC(nibName: "SignUpVC", bundle: nil)
        
        viewControllers = [signInVC, signUpVC]
        
        pageViewController.setViewControllers([viewControllerAtIndex(0)!], direction: .forward, animated: true, completion: nil)
        pageViewController.dataSource = self
        
        addChild(pageViewController)
        loginContainerView.addSubview(pageViewController.view)
        
        pageViewController!.view.frame = loginContainerView.bounds
        pageViewController.didMove(toParent: self)
        
        
        // Disable Scrollable for PageView
        //        view.gestureRecognizers = pageViewController.gestureRecognizers
        for view in pageViewController.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }
    }
    
    func changeTabColor(isLogin: Bool = true){
        btnSignInTab.setTitleColor(isLogin ? BUTTON_SELECT_TAB_COLOR : BUTTON_UNSELECT_TAB_COLOR, for: .normal)
        btnSignUpTab.setTitleColor(!isLogin ? BUTTON_SELECT_TAB_COLOR : BUTTON_UNSELECT_TAB_COLOR, for: .normal)
    }
    
    // MARK: - Actions
    @IBAction func loginAction(_ sender: Any) {
        pageViewController.setViewControllers([(viewControllerAtIndex(0)!)], direction: .reverse, animated: true, completion: nil)
        UIView.animate(withDuration: 0.3) {
            self.changeTabColor(isLogin: true)
            self.subLineView.transform = CGAffineTransform.identity
        }
        
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        pageViewController.setViewControllers([viewControllerAtIndex(1)!], direction: .forward, animated: true, completion: nil)
        UIView.animate(withDuration: 0.3) {
            self.changeTabColor(isLogin: false)
            self.subLineView.transform = CGAffineTransform(translationX: self.subLineView.frame.width + 5.0, y: 0)
        }
    }
    
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - UIPageViewController DataSource and Delegate
extension LoginVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = indexOfViewController(viewController)
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = indexOfViewController(viewController)
        
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        
        if index == viewControllers.count {
            return nil
        }
        
        return viewControllerAtIndex(index)
    }
}

// MARK: - Helpers
extension LoginVC {
    func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        if viewControllers.count == 0 || index >= viewControllers.count {
            return nil
        }
        return viewControllers[index]
    }
    
    func indexOfViewController(_ viewController: UIViewController) -> Int {
        return viewControllers.index(of: viewController) ?? NSNotFound
    }
}
