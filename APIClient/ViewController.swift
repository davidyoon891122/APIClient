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
        
        let newsViewController = self.storyboard?.instantiateViewController(withIdentifier: "NewsViewController")
        
        //newsViewController?.modalPresentationStyle = .fullScreen
        
        //presnet할 경우 뒤로 돌아갈 방법을 다르게 구현 해주어야 함.
        //self.present(newsViewController!, animated: true, completion: nil)
        
        if let view = newsViewController {
            self.navigationController?.pushViewController(view, animated: true)
        }

        
    }
    
}

