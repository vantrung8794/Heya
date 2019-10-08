//
//  HomeVC.swift
//  Heya
//
//  Created by TrungNV on 10/7/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import UIKit

class HomeVC: BaseTabViewController {

    @IBOutlet weak var lblTest: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTest.textColor = startMainColor
        // Do any additional setup after loading the view.
    }
}
