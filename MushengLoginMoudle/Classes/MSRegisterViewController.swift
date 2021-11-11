//
//  MSRegisterViewController.swift
//  MushengLoginMoudle
//
//  Created by dss on 2021/11/11.
//

import UIKit

enum RegisterPageActionType {
    case verifyLogin
    case pwdLogin
    case forgetPwd
}

class MSRegisterViewController: UIViewController {

    ///标题
    private var titleLab: UILabel!
    ///提示
    private var tipsLab: UILabel!
    
    ///确认密码
    private var confirmPwdV: MSLoginInputView!
    
    ///忘记密码
    private var forgetPwdBtn: UIButton!
    ///手机验证码登录
    private var codeLoginBtn: UIButton!
    ///手机验证码登录
    private var pwdLoginBtn: UIButton!
    
    ///登录按钮
    private var loginBtn: UIButton!
    
    
    ///操作类型
    var actionType: RegisterPageActionType = .verifyLogin
    

    ///手机号
    lazy var phoneNumV: MSLoginInputView = {
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
    lazy var verifyCodeV: MSLoginInputView = {
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
    lazy var passwordV: MSLoginInputView = {
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        setupInterface()
    }

    
    
    func setupInterface() {
        titleLab = UILabel.init(frame: .zero)
        titleLab.text = "手机验证码登录"
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
        tipsLab.text = "未注册的手机号验证通过后将自动注册"
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
        
        pwdLoginBtn = UIButton.init(type: .custom)
        pwdLoginBtn.setTitle("密码登录", for: .normal)
        pwdLoginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        pwdLoginBtn.backgroundColor = .orange
        pwdLoginBtn.setContentHuggingPriority(.required, for: .horizontal)
        pwdLoginBtn.addTarget(self, action: #selector(codeLoginBtnClick(sender:)), for: .touchUpInside)
        self.view.addSubview(pwdLoginBtn)
        pwdLoginBtn.snp.makeConstraints { make in
            make.right.equalTo(phoneNumV).offset(-15)
            make.top.equalTo(passwordV.snp.bottom)
            make.height.equalTo(40)
        }
        
        forgetPwdBtn = UIButton.init(type: .custom)
        forgetPwdBtn.setTitle("忘记密码？", for: .normal)
        forgetPwdBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        forgetPwdBtn.backgroundColor = .orange
        forgetPwdBtn.setContentHuggingPriority(.required, for: .horizontal)
        forgetPwdBtn.addTarget(self, action: #selector(forgetPwdBtnClick(sender:)), for: .touchUpInside)
        self.view.addSubview(forgetPwdBtn)
        forgetPwdBtn.snp.makeConstraints { make in
            make.left.equalTo(phoneNumV).offset(15)
            make.centerY.height.equalTo(pwdLoginBtn)
        }
        
        codeLoginBtn = UIButton.init(type: .custom)
        codeLoginBtn.setTitle("手机验证码登录", for: .normal)
        codeLoginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        codeLoginBtn.backgroundColor = .orange
        codeLoginBtn.setContentHuggingPriority(.required, for: .horizontal)
        codeLoginBtn.addTarget(self, action: #selector(codeLoginBtnClick(sender:)), for: .touchUpInside)
        self.view.addSubview(codeLoginBtn)
        codeLoginBtn.snp.makeConstraints { make in
            make.right.equalTo(phoneNumV).offset(-15)
            make.centerY.height.equalTo(forgetPwdBtn)
        }
        
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
    
    
    
    ///忘记密码
    @objc func forgetPwdBtnClick(sender: UIButton) {
        let vc = MSForgetViewController.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    ///验证码登录
    @objc func codeLoginBtnClick(sender: UIButton) {
        
    }
    
    ///登录
    @objc func loginBtnClick(sender: UIButton) {
        
    }
}
