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
    
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    var didLoginSuccess: ((_ userName: String?, _ pass: String?) -> Void)?
    
    let userName = "ttc"
    let pass = "123"
    
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
    
    @IBAction func signInAction(_ sender: Any) {
        AppUtils.showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            AppUtils.hideLoading()
            if self.tfUserName.text?.trim() == self.userName && self.tfPassword.text?.trim() == self.pass{
                if let didSuccess = self.didLoginSuccess{
                    didSuccess(self.tfUserName.text?.trim(), self.tfPassword.text?.trim())
                }
            }else{
                TAlertView(alertTitle: "Thất bại", sub: nil, alertMainText: "Sai tên tài khoản hoặc mật khẩu.", haveCancel: false, didAccept: nil, didCancel: nil).show()
            }
            
        }
        
    }
    
}
