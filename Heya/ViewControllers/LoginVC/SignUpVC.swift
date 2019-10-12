//
//  SignUpVC.swift
//  Heya
//
//  Created by TrungNV on 10/12/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var viewUserName: UIView!
    @IBOutlet weak var viewPassWord: UIView!
    @IBOutlet weak var viewConfirmPass: UIView!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
// MARK: - Functions
    func initUI() {
        viewUserName.setRadius()
        viewPassWord.setRadius()
        viewConfirmPass.setRadius()
        btnSignUp.setRadius()
    }

}
