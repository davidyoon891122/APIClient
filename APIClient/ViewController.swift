//
//  ViewController.swift
//  APIClient
//
//  Created by David Yoon on 2021/07/12.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textFieldUserID: UITextField!
    
    @IBOutlet var textFieldUserPWD: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        textFieldUserID.delegate = self
        textFieldUserPWD.delegate = self
        
    }

    @IBAction func btnLoginAction(_ sender: UIButton) {
        // 일반적인 조건문으로 진행하면 첫 번째 조건에만 반응
        
        if textFieldUserID.text! == "" {
            let idAlertContoller = UIAlertController(title: "Empty UserID", message: "Please insert your ID", preferredStyle: UIAlertController.Style.alert)
            let idAlertAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil)
            
            idAlertContoller.addAction(idAlertAction)
            present(idAlertContoller, animated: true, completion: nil)
        }else if textFieldUserPWD.text! == ""
        {
            let pwdAlertController = UIAlertController(title: "Empty UserPassword", message: "Plase insert your password", preferredStyle: UIAlertController.Style.alert)
            let pwdAlertAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil)
            
            pwdAlertController.addAction(pwdAlertAction)
            present(pwdAlertController, animated: true, completion: nil)
        }else {
            // 유저 정보 체크 모델에 유저 데이터 넣어서 던짐
            let userID = textFieldUserID.text!
            let userPWD = textFieldUserPWD.text!
            let loginModel = LoginModel()
            loginModel.userID = userID
            loginModel.userPWD = userPWD
            loginModel.printUserInfo()
            let loginResult = loginModel.checkUserInfo()
            
            print("loginResult: \(loginResult) ")
            // 1. change return type from String -> 0000(4digis)
            // 2. read message from code
            
            if loginResult == 0003 {
                let newsViewController = self.storyboard?.instantiateViewController(withIdentifier: "NewsViewController")
                
                if let view = newsViewController {
                    self.navigationController?.pushViewController(view, animated: true)
                }
            }else {
                var errorMessage = loginModel.getErrorMessage(resultCode: loginResult)
                var errorAlert = UIAlertController(title: "Login Error", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
                var errorAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                
                errorAlert.addAction(errorAction)
                self.present(errorAlert, animated: true, completion: nil)
                
                
            }
            
        }
        
        //newsViewController?.modalPresentationStyle = .fullScreen
        
        //present할 경우 뒤로 돌아갈 방법을 다르게 구현 해주어야 함. present 화면 띄울 때 사용
        //self.present(newsViewController!, animated: true, completion: nil)
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 텍스트 필드 변화때마다 콜백함수 현재 텍스트, 로케이션, 길이 출력
        print(textField.text!, range.location, range.length)
        return true
    }
    
}

