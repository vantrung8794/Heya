//
//  HistoryTableViewCell.swift
//  Heya
//
//  Created by TrungNV on 10/14/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var subView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subView.setRadius()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
