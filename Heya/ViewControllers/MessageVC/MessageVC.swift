//
//  MessageVC.swift
//  Heya
//
//  Created by TrungNV on 10/8/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import UIKit

class MessageVC: BaseTabViewController {
    var viewControllers: [UIViewController]!
    var pageViewController: UIPageViewController!

    @IBOutlet weak var mainSegment: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageController()
        initUI()
    }
    
    // MARK: - Functions
    func initUI(){
       
    }
    
    func setupPageController() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.delegate = self
        
        let messageTabVC = MessageTabView(nibName: "MessageTabView", bundle: nil)
        let friendsVC = AllFriendsVC(nibName: "AllFriendsVC", bundle: nil)
        
        viewControllers = [messageTabVC, friendsVC]
        
        pageViewController.setViewControllers([viewControllerAtIndex(0)!], direction: .forward, animated: false, completion: nil)
        pageViewController.dataSource = self
        
        addChild(pageViewController)
        containerView.addSubview(pageViewController.view)
        
        pageViewController!.view.frame = containerView.bounds
        pageViewController.didMove(toParent: self)
        
        
        // Disable Scrollable for PageView
        //        view.gestureRecognizers = pageViewController.gestureRecognizers
        for view in pageViewController.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }
    }
    
    @IBAction func changeSegmentValue(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        
        if index == 0{
            pageViewController.setViewControllers([viewControllerAtIndex(0)!], direction: .forward, animated: true, completion: nil)
        }
        if index == 1{
            pageViewController.setViewControllers([viewControllerAtIndex(1)!], direction: .reverse, animated: true, completion: nil)
        }
    }
}

// MARK: - UIPageViewController DataSource and Delegate
extension MessageVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
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
extension MessageVC {
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
