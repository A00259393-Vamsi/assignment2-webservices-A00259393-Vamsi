//
//  ImageViewController.swift
//  Assignment2:WebServices
//
//  Created by Shubham Dhamane on 30/10/22.
//

import Foundation
import UIKit

class ImageViewController: UIViewController {
    
    var dogName: String!
    let URL: String = "https://dog.ceo/api/breed/"
    //set dog image, breed name, and spinner
    @IBOutlet weak var dogImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url: String = URL + dogName + "/images"
        //fetch dog image by dog breed name
            APIHelper.fetchImage(url: url ) {dogImage in
                //pause
                for _ in 0...1000000{
                    continue
                }
                do{
                    try
                    //set image the first json image url and transfer it to UIImage
                    self.dogImage.image = UIImage(data: NSData(contentsOf: NSURL(string: dogImage[0])! as URL) as Data)
                }catch let error{
                    print(error)
                }
          }
    }
    
    @IBAction func NewImageButton(_ sender: Any) {
        let url: String = URL + dogName + "/images"
            //fetch dog image by dog breed name
            APIHelper.fetchImage(url: url ) {dogImage in
                //pause
                for _ in 0...1000000{
                    continue
                }
                         
                do{
                try
                    //set image in the random json image url and transfer it to UIImage
                   self.dogImage.image = UIImage(data: NSData(contentsOf: NSURL(string: dogImage.randomElement()!)! as URL) as Data)
  
               }catch let error{
                   print(error)
               }
          }
    }


}
