//
//  UserCollectionViewCell.swift
//  Heya
//
//  Created by TrungNV on 10/11/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var btnAddFriend: UIButton!
    @IBOutlet weak var btnFollow: UIButton!
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.setRadius()
        btnAddFriend.setRadius()
        btnFollow.setRadius()
    }
    
    func configCell(_ data: UserBO){
        imgUser.image = UIImage(named: data.avatarURL!)
        lblName.text = data.name
        lblInfo.text = data.info
    }

}
