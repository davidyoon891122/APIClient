//
//  NewsDetailController.swift
//  APIClient
//
//  Created by David Yoon on 2021/07/18.
//

import UIKit

class NewsDetailContoller: UIViewController {
    
    @IBOutlet var newsImageView: UIImageView!
    @IBOutlet var newsContentsView: UILabel!
    
    var imageURL: String?
    var contents: String?
}
