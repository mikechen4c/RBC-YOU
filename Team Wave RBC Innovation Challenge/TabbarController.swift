//
//  TabbarController.swift
//  Team Wave RBC Innovation Challenge
//
//  Created by Ziyin Wang on 2016-09-24.
//  Copyright © 2016 Team Wave. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        self.tabBar.items?[0].image = UIImage(named: "event")
        self.tabBar.items?[0].selectedImage = UIImage(named: "event selected")

        self.tabBar.items?[1].image = UIImage(named: "home")
        self.tabBar.items?[1].image = UIImage(named: "home selected")
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if tabBarController.selectedViewController == nil || tabBarController.selectedViewController == viewController {
            return false
        }
        
        if let fromView = tabBarController.selectedViewController?.view, let toView = viewController.view {
            
            tabBarController.selectedViewController?.view.superview?.addSubview(viewController.view)
            
            UIView.transition(from: fromView, to: toView, duration: 0.2, options: .transitionCrossDissolve, completion: nil)
            
        }
        
        return true
    }
    
    //    -(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    //
    //    if (tabBarController.selectedViewController == nil || tabBarController.selectedViewController == viewController) {
    //    return NO;
    //    }
    //
    //    UIView *fromView = tabBarController.selectedViewController.view;
    //    UIView *toView = viewController.view;
    //
    //    [tabBarController.selectedViewController.view.superview addSubview:viewController.view];
    //
    //    [UIView transitionFromView:fromView toView:toView duration:0.2 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
    //
    //    
    //    }];
    //    
    //    return true;
    //    
    //    }
    
    
    
}
