//
//  MSCompleteInfoController.swift
//  MushengLoginMoudle
//
//  Created by dss on 2021/11/11.
//

import UIKit

class MSCompleteInfoController: UIViewController {

    ///标题
    private var titleLab: UILabel!
    
    ///头像背景
    private var avatarBgV: UIImageView!
    ///头像
    private var avatarV: UIImageView!
    
    
    ///性别提示
    private var genderTipsLab: UILabel!
    ///男
    private var maleBtn: UIButton!
    ///女
    private var femaleBtn: UIButton!
    
    
    ///年龄提示
    private var ageTipsLab: UILabel!
    ///年龄按钮
    private var ageBtn: UIButton!
    
    
    ///登录按钮
    private var loginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        setupInterface()
    }

    
    func setupInterface() {
        titleLab = UILabel.init(frame: .zero)
        titleLab.text = "完善个人资料"
        titleLab.textAlignment = .left
        titleLab.font = UIFont.boldSystemFont(ofSize: 28)
        titleLab.textColor = .white
        titleLab.sizeToFit()
        self.view.addSubview(titleLab)
        titleLab.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().inset(90)
        }
        
        avatarBgV = UIImageView.init(frame: .zero)
        avatarBgV.layer.masksToBounds = true
        avatarBgV.layer.cornerRadius = 10
        avatarBgV.backgroundColor = .orange
        self.view.addSubview(avatarBgV)
        avatarBgV.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLab.snp.bottom).offset(15)
            make.width.height.equalTo(80)
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
