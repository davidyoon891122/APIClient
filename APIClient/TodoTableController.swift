//
//  TodoTableController.swift
//  APIClient
//
//  Created by David Yoon on 2021/07/20.
//

import UIKit

class TodoTableContoller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        cell.textLabel?.text = "test"
        
        return cell
    }
    
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    
}
