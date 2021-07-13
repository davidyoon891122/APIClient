//
//  ViewController.swift
//  APIClient
//
//  Created by David Yoon on 2021/07/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textViewUserID: UITextField!
    
    @IBOutlet var textViewUserPWD: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLoginAction(_ sender: UIButton) {
        
        if let userID = textViewUserID.text {
            print("User ID : \(userID)")
        }
        
        if let userPWD = textViewUserPWD.text {
            print("User PWD : \(userPWD)")
        }
        
        
        

        
    }
    
}

