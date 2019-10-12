//
//  LandMarkTableViewCell.swift
//  Heya
//
//  Created by TrungNV on 10/11/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import UIKit

class LandMarkTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var radiusView: UIView!
    @IBOutlet weak var btnInfo: UIButton!
    @IBOutlet weak var imgLandMark: UIImageView!
    @IBOutlet weak var lblHashTag: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.createShadow()
        radiusView.setRadius()
        btnInfo.setRadius()
        
    }
    
    func configCell(_ data: LandMarkBO) {
        imgLandMark.image = UIImage(named: data.imageURL!)
        let numColor = Int.random(in: 0..<COLOR_LIST_FOR_HASH_TAG.count)
        lblHashTag.textColor = COLOR_LIST_FOR_HASH_TAG[numColor]
        lblHashTag.text = "#\(data.hashTag!)"
        
        switch data.type {
        case .A:
            lblType.text = "Danh lam thắng cảnh"
        case .B:
            lblType.text = "Di tích lịch sử"
        case .C:
            lblType.text = "Địa điểm ăn uống"
        }
        lblname.text = data.name
        lblLocation.text = data.location
        
    }
}
