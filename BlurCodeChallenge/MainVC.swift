//
//  MainVC.swift
//  BlurCodeChallenge
//
//  Created by Felix Changoo on 11/6/17.
//  Copyright © 2017 Felix Changoo. All rights reserved.
//

import UIKit

class MainVC: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //put the images for the tab bars after designing them
        let homeFeedVC = HomeFeedVC()
        let incompleteVC1 = EmptyVC()
        let incompleteVC2 = EmptyVC()
        let incompleteVC3 = EmptyVC()
        let incompleteVC4 = EmptyVC()

        //this is temporary naming 
        let tab1: UITabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "icon1"))

        homeFeedVC.tabBarItem = tab1
        
        let tab2: UITabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon2")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "icon2"))
        
        incompleteVC1.tabBarItem = tab2
        
        let tab3: UITabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon3")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "icon3"))
        
        incompleteVC2.tabBarItem = tab3
        
        let tab4: UITabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon4")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "icon4"))
        
        incompleteVC3.tabBarItem = tab4
        
        let tab5: UITabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon5")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "icon5"))
        
        incompleteVC4.tabBarItem = tab5
        
        
        self.tabBar.tintAdjustmentMode = .normal
        self.viewControllers = [homeFeedVC, incompleteVC1, incompleteVC2,
                                incompleteVC3, incompleteVC4]
        
        

    }
}
