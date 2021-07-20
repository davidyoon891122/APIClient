//
//  TabBarContoller.swift
//  APIClient
//
//  Created by David Yoon on 2021/07/20.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("TabBarController")
        self.navigationItem.setHidesBackButton(true, animated: false)
        
    }
}
