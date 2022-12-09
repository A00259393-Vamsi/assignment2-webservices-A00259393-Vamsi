//
//  ViewController.swift
//  Assignment2:WebServices
//
//  Created by Cambrian on 2022-10-19.
//

import UIKit

class ViewController: UITableViewController {

    var dog = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //set table row height
        self.tableView.rowHeight = 40.0
        //fetch dog list
        APIHelper.fetchdog{newArray in
            self.dog = newArray
            self.tableView.reloadData()
       }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dog.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as!
        TableViewCell
        
        //set cell's label with dog breed
        cell.Name.text = dog[indexPath.row]
        
        //fetch dog name
        APIHelper.fetchdog { newArray in
            let URL: String = "https://dog.ceo/api/breed/"
                let List = newArray[indexPath.row]
                let url: String = URL + List + "/images"
                //fetch dog image with dog breed
                APIHelper.fetchImage(url: url ) {dogImage in
                    //load pause
                    for _ in 0...100000{
                        continue
                    }
                    do{
                        try
                        cell.dogImage.image = UIImage(data: NSData(contentsOf: NSURL(string: dogImage[0])! as URL) as Data)
                    }catch let error{
                        print(error)
                    }
   
               }
        }
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        //set cell as index
        let index = tableView.indexPathForSelectedRow!.row
        //set selected dog name value (string)
        let selectedDog = dog[index].self
        let dst = segue.destination as! ImageViewController
        //set dog breed view controller's variable dogName as selected dog name
        dst.dogName = selectedDog
    }

}

