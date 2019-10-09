//
//  ListTableViewCell.swift
//  ExpandCollapseTest
//
//  Created by Krishna on 09/10/19.
//  Copyright © 2019 Krishna. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblSubCategoryTitle: UILabel!
    @IBOutlet weak var lblDisplayName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
