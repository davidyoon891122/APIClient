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
    
    
    override func viewDidLoad() {
        // get imageURL
        
        if let url = imageURL {
            print(url)
            if let data = try? Data(contentsOf: URL(string: url)!) {
                DispatchQueue.main.async {
                    self.newsImageView.image = UIImage(data: data)
                }
            }
        }
        
        
        if let descText = contents {
            self.newsContentsView.text = descText
        }
    }
}
