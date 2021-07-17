//
//  LoginModel.swift
//  APIClient
//
//  Created by David Yoon on 2021/07/16.
//

import Foundation


class LoginModel {
    
    var _userID: String?
    var _userPWD: String?
    
    let tmpUserID = "davidyoon"
    let tmpUserPWD = "test1234"
    
    var userID:String? {
        get{
            return self._userID
        }
        set(newValue) {
            self._userID = newValue
        }
    }
    
    var userPWD: String? {
        get {
            return self._userPWD
        }
        set(newValue) {
            self._userPWD = newValue
        }
    }
    
    private let errorDic: Dictionary<Int,String> = [
        0002 : "Please check your ID",
        0004 : "Please check your Password",
    ]
    
    
    
    func getErrorMessage (resultCode: Int) -> String {
        return self.errorDic[resultCode]!
    }
    

    
    private enum ResultCode{
        case PassUserID
        case FailUserID
        case PassUserPWD
        case FailUserPWD
    }
    
    
    private func getLoginMessage(err: ResultCode) -> Int{
        switch err {
        case .PassUserID:
            return 0001
        case .FailUserID:
            return 0002
        case .PassUserPWD:
            return 0003
        case .FailUserPWD:
            return 0004
        }
    }
    
    
    func checkUserInfo() -> Int {
        if let inputID = userID {
            if inputID == self.tmpUserID {
                if let inputPWD = userPWD {
                    if inputPWD == self.tmpUserPWD {
                        return getLoginMessage(err: ResultCode.PassUserPWD)
                    } else {
                        return getLoginMessage(err: ResultCode.FailUserPWD)
                    }
                    
                }
            } else {
                return getLoginMessage(err: ResultCode.FailUserID)
            }
            
        }
        return 0000
    }
    
    func printUserInfo() {
        print("UserID : \(userID!), UserPWD: \(userPWD!)")
    }
    
    
    
    
}
