//
//  MyTableViewCell.swift
//  Exam Local Data Base
//
//  Created by HARSHID PATEL on 12/04/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var idLable: UILabel!
    
    @IBOutlet weak var nameLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
