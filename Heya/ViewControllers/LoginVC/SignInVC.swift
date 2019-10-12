//
//  SignInVC.swift
//  Heya
//
//  Created by TrungNV on 10/12/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    @IBOutlet weak var viewUserName: UIView!
    @IBOutlet weak var viewPassWord: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnForgotPass: UIButton!
    @IBOutlet weak var btnLoginWithGoogle: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    //MARK: - Functions
    func initUI(){
        viewUserName.setRadius()
        viewPassWord.setRadius()
        btnLogin.setRadius()
        btnForgotPass.setRadius()
        btnLoginWithGoogle.setRadius()
    }

}
