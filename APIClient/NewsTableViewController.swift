//
//  NewsTableViewController.swift
//  APIClient
//
//  Created by David Yoon on 2021/07/15.
//

import UIKit

class NewsTableViewController: UITableViewController {
    var newsData: Array<Dictionary<String,Any>>?
    
    @IBOutlet var lblMyCell: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TableViewTest")
        getNews()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let news = newsData {
            return news.count
        } else {
            return 0
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell
        
        let idx = indexPath.row
        if let news = newsData {
            let row = news[idx]
            if let value = row as? Dictionary<String, Any> {
                if let title = value["title"]! as? String {
                    cell.lblMyCell.text = title
                }
            }
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("Clicked !! \(indexPath.row)")
        // 이방식은 바닥에서 올라오는 방식
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let newsDetail = storyboard?.instantiateViewController(identifier: "NewsDetailContoller") as! NewsDetailContoller
        
        if let news = newsData{
            let row = news[indexPath.row]
            
            if let r = row as? Dictionary<String,Any> {
                if let imageUrl = r["urlToImage"] as? String {
                    newsDetail.imageURL = imageUrl
                }
                
                if let contents = r["description"] as? String {
                    newsDetail.contents = contents
                }
            }
            
        }
        
        //showDetailViewController(newsDetail, sender: nil)
        
        
    }
    
    //segue 방식 화면을 넘김(백버튼 존재)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, "NewsDetail" == id {
            if let contoller = segue.destination as? NewsDetailContoller {
                if let news = newsData {
                    if let indexPath = tableView.indexPathForSelectedRow {
                        let row = news[indexPath.row]
                        if let value = row as? Dictionary<String, Any> {
                            if let imageUrl = value["urlToImage"] as? String {
                                contoller.imageURL = imageUrl
                            }
                            
                            if let contents = value["description"] as? String {
                                contoller.contents = contents
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    func getNews() {
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=05409300ee7a4b688b07cd7985890cd9")!) { data, response, error in
            if let dataJson = data {
                //JSON으로 데이터 parsing
                do {
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    let articles = json["articles"] as! Array<Dictionary<String,Any>>
                    self.newsData = articles
                    //네트워크 통신은 메인에서 화면 그리게 올려주어야 한다
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
                catch {
                    print("뭐지 캐치 ?")
                    print("\(error)")
                }
            } else {
                print("Data 없음")
            }
        }
        
        task.resume()
    }
    
    
}
