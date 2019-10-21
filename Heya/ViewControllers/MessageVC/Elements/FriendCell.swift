//
//  FriendCell.swift
//  Heya
//
//  Created by TrungNV on 10/15/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnChat: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(_ data: UserBO){
        imgAvatar.setRadius(20.0)
        imgAvatar.image = UIImage(named: data.avatarURL.value())
        lblName.text = data.name.value()
    }
}
