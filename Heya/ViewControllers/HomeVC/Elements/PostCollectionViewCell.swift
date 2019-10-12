//
//  PostCollectionViewCell.swift
//  Heya
//
//  Created by TrungNV on 10/10/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img_LandMark: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgAvatar: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.setRadius()
        imgAvatar.setRadius(imgAvatar.frame.height / 2)
    }
    
    func configCell(_ data: PostBO) {
        img_LandMark.image = UIImage(named: (data.landmark?.imageURL!)!)
        imgAvatar.image = UIImage(named: data.user!.avatarURL!)
        lblTitle.text = data.name
        lblLocation.text = data.landmark?.name
        lblUserName.text = data.user?.name
        lblTime.text = data.time
    }

}
