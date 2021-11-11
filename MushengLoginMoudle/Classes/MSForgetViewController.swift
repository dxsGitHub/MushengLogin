//
//  MSForgetViewController.swift
//  MushengLoginMoudle
//
//  Created by dss on 2021/11/11.
//

import UIKit

class MSForgetViewController: UIViewController {

    ///标题
    private var titleLab: UILabel!
    ///提示
    private var tipsLab: UILabel!
    
    ///登录按钮
    private var loginBtn: UIButton!
    

    ///手机号
    lazy private var phoneNumV: MSLoginInputView = {
        let phoneV = MSLoginInputView.init(frame: CGRect.zero, style: .phone)
        phoneV.backgroundColor = .white
        phoneV.placeHoler = "请输入手机号"
        self.view.addSubview(phoneV)
        phoneV.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(tipsLab.snp.bottom).offset(15)
            make.height.equalTo(50)
        }
        return phoneV
    }()
    
    ///验证码
    lazy private var verifyCodeV: MSLoginInputView = {
        let verifyV = MSLoginInputView.init(frame: CGRect.zero, style: .code)
        verifyV.backgroundColor = .white
        verifyV.placeHoler = "请输入验证码"
        self.view.addSubview(verifyV)
        verifyV.snp.makeConstraints { make in
            make.left.right.height.equalTo(phoneNumV)
            make.top.equalTo(phoneNumV.snp.bottom)
        }
        return verifyV
    }()
    
    ///密码
    lazy private var passwordV: MSLoginInputView = {
        let pwdV = MSLoginInputView.init(frame: CGRect.zero, style: .password)
        pwdV.backgroundColor = .white
        pwdV.placeHoler = "请输入密码"
        self.view.addSubview(pwdV)
        pwdV.snp.makeConstraints { make in
            make.left.right.height.equalTo(phoneNumV)
            make.top.equalTo(verifyCodeV.snp.bottom)
        }
        return pwdV
    }()
    
    ///确认密码
    lazy private var confirmPwdV: MSLoginInputView = {
        let confirmV = MSLoginInputView.init(frame: CGRect.zero, style: .password)
        confirmV.backgroundColor = .white
        confirmV.placeHoler = "请输入确认密码"
        self.view.addSubview(confirmV)
        confirmV.snp.makeConstraints { make in
            make.left.right.height.equalTo(phoneNumV)
            make.top.equalTo(passwordV.snp.bottom)
        }
        return confirmV
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        setupInterface()
    }

    
    func setupInterface() {
        titleLab = UILabel.init(frame: .zero)
        titleLab.text = "找回密码"
        titleLab.textAlignment = .left
        titleLab.font = UIFont.boldSystemFont(ofSize: 28)
        titleLab.textColor = .white
        titleLab.sizeToFit()
        self.view.addSubview(titleLab)
        titleLab.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().inset(110)
        }
        
        tipsLab = UILabel.init(frame: .zero)
        tipsLab.text = "下次可以通过手机号和新密码登录"
        tipsLab.textAlignment = .left
        tipsLab.font = UIFont.systemFont(ofSize: 10)
        tipsLab.textColor = .white
        tipsLab.sizeToFit()
        self.view.addSubview(tipsLab)
        tipsLab.snp.makeConstraints { make in
            make.left.equalTo(titleLab)
            make.top.equalTo(titleLab.snp.bottom).offset(5)
        }
        
        self.view.addSubview(self.phoneNumV)
        self.view.addSubview(self.verifyCodeV)
        self.view.addSubview(self.passwordV)
        self.view.addSubview(self.confirmPwdV)
        
        loginBtn = UIButton.init(type: .custom)
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        loginBtn.backgroundColor = .orange
        loginBtn.setContentHuggingPriority(.required, for: .horizontal)
        loginBtn.addTarget(self, action: #selector(loginBtnClick(sender:)), for: .touchUpInside)
        self.view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().inset(160)
            make.height.equalTo(60)
        }
    }
    
    
    ///登录
    @objc func loginBtnClick(sender: UIButton) {
        let vc = MSCompleteInfoController.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
