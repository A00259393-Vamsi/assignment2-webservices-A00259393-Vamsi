//
//  TableViewCell.swift
//  Assignment2:WebServices
//
//  Created by Shubham Dhamane on 30/10/22.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var dogImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
