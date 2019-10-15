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
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblGoingWith: UILabel!
    @IBOutlet weak var imgState: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subView.setRadius()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(_ data: HistoryBO){
        lblTitle.text = data.title.value()
        lblTime.text = data.time.value()
        lblLocation.text = data.location.value()
        
        imgState.image = data.isOk ? UIImage(named: "ic_success_30") : UIImage(named: "ic_fail_30")
    }
}
