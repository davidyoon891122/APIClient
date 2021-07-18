//
//  WebViewController.swift
//  APIClient
//
//  Created by David Yoon on 2021/07/18.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var lblURLField: UITextField!
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        print("WebViewController")
        // hide tabbar navigate back button
        self.tabBarController!.navigationItem.setHidesBackButton(true, animated: false)
        webView.navigationDelegate = self
        loadWebPage("http://github.com/davidyoon891122")
        
    }
    
    // load webPage from URL
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }
    
    
    @IBAction func btnWebAction(_ sender: UIButton) {
        let url = checkURL(lblURLField.text!)
        lblURLField.text = ""
        loadWebPage(url)
        
    }
    
    func checkURL(_ url:String) -> String {
        var strURL = url
        let flag = strURL.hasPrefix("https://")
        if !flag {
            strURL = "https://" + strURL
        }
        
        return strURL
    }
    
    // 작업이 진행중 일 떄,
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicatorView.startAnimating()
        activityIndicatorView.isHidden = false
    }
    
    // 실패 했을 때
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicatorView.startAnimating()
        activityIndicatorView.isHidden = false
    }
    
    // 완료되었을 때,
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicatorView.startAnimating()
        activityIndicatorView.isHidden = true
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    
    @IBAction func btnReflesh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    
    @IBAction func btnRewind(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func btnForward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
}
