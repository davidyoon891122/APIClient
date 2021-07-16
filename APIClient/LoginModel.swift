//
//  LoginModel.swift
//  APIClient
//
//  Created by David Yoon on 2021/07/16.
//

import Foundation


class LoginModel {
    
    let tmpUserID = "davidyoon"
    let tmpUserPWD = "test1234"
    
    var userID:String? {
        get{
            return userID
        }
        set(newValue) {
            userID = newValue
        }
    }
    
    var userPWD: String? {
        get {
            return userPWD
        }
        set(newValue) {
            userPWD = newValue
        }
    }
    
    
    
    
    enum ErrorCode{
        case PassUserID
        case FailUserID
        case PassUserPWD
        case FailUserPWD
    }
    
    
    func getLoginMessage(err: ErrorCode) -> String{
        switch err {
        case .PassUserID:
            return "Please insert your password"
        case .FailUserID:
            return "Please check your ID"
        case .PassUserID:
            return "Hello, Login Success!!"
        case .FailUserPWD:
            return "Please check your password"
        default:
            return "nil"
        }
    }
    
    func checkUserInfo() -> String {
        if let inputID = userID {
            if inputID == self.tmpUserID {
                if let inputPWD = userPWD {
                    if inputPWD == self.tmpUserPWD {
                        return getLoginMessage(err: ErrorCode.PassUserPWD)
                    } else {
                        return getLoginMessage(err: ErrorCode.FailUserPWD)
                    }
                    
                }
            } else {
                return getLoginMessage(err: ErrorCode.FailUserID)
            }
            
        }
        return "nil"
    }
    
    
    
    
}
