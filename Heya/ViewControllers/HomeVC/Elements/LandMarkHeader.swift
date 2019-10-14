//
//  LandMarkHeader.swift
//  Heya
//
//  Created by TrungNV on 10/14/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import UIKit

class LandMarkHeader: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblHeader: UILabel!
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           commonInit()
       }
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           commonInit()
       }
       public func commonInit(){
           Bundle.main.loadNibNamed("LandMarkHeader", owner: self, options: nil)
           addSubview(contentView)
           contentView.frame = bounds
           contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
       }

}
