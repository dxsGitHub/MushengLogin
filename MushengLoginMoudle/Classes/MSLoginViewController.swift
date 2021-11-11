//
//  MSLoginViewController.swift
//  MushengLoginMoudle
//
//  Created by High on 2021/11/6.
//

import UIKit
import SnapKit
import YYKit

public
class MSLoginViewController: UIViewController {

    ///背景图
    private var bgImageV: UIImageView!
    ///logo
    private var logoV: UIImageView!
    
    ///手机登录
    private var phoneBtn: UIButton!
    ///苹果账号登录
    private var appleBtn: UIButton!
    
    ///更多登录提示文本
    private var moreTypeLab: UILabel!
    ///微信登录
    private var wechatBtn: UIButton!
    ///QQ登录
    private var qqBtn: UIButton!
    
    ///协议视图
    private var protocolV: MSLoginProtocolView!
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupInterface()
    }
    
    func setupInterface() {
        bgImageV = UIImageView.init(frame: self.view.bounds)
        bgImageV.backgroundColor = .gray
        self.view.addSubview(bgImageV)
        
        logoV = UIImageView.init()
        logoV.backgroundColor = .red
        logoV.image = UIImage.init(named: "login_main_logo")
        self.view.addSubview(logoV)
        logoV.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
            make.top.equalToSuperview().inset(180)
        }
        
        phoneBtn = UIButton.init(type: .custom)
        phoneBtn.setTitle("手机登录", for: .normal)
        phoneBtn.setImage(UIImage.init(named: "login_icon_tel"), for: .normal)
        phoneBtn.backgroundColor = .orange
        phoneBtn.addTarget(self, action: #selector(phoneLoginBtnClick(sender:)), for: .touchUpInside)
        self.view.addSubview(phoneBtn)
        phoneBtn.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(50)
            make.top.equalTo(logoV.snp.bottom).offset(150)
        }
        
        appleBtn = UIButton.init(type: .custom)
        appleBtn.setTitle("Apple账号登录", for: .normal)
        appleBtn.backgroundColor = .orange
        appleBtn.setImage(UIImage.init(named: "login_icon_tel"), for: .normal)
        appleBtn.addTarget(self, action: #selector(phoneLoginBtnClick(sender:)), for: .touchUpInside)
        self.view.addSubview(appleBtn)
        appleBtn.snp.makeConstraints { make in
            make.left.right.height.equalTo(phoneBtn)
            make.top.equalTo(phoneBtn.snp.bottom).offset(15)
        }
        
        moreTypeLab = UILabel.init()
        moreTypeLab.text = "其他方式"
        moreTypeLab.textAlignment = .center
        moreTypeLab.font = UIFont.systemFont(ofSize: 14)
        moreTypeLab.textColor = .white
        self.view.addSubview(moreTypeLab)
        moreTypeLab.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalTo(appleBtn.snp.bottom).offset(30)
        }
        
        wechatBtn = UIButton.init(type: .custom)
        wechatBtn.setTitle("", for: .normal)
        wechatBtn.setImage(UIImage.init(named: "login_icon_wechat"), for: .normal)
        wechatBtn.addTarget(self, action: #selector(phoneLoginBtnClick(sender:)), for: .touchUpInside)
        self.view.addSubview(wechatBtn)
        wechatBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(45)
            make.width.height.equalTo(40)
            make.top.equalTo(appleBtn.snp.bottom).offset(80)
        }
        
        qqBtn = UIButton.init(type: .custom)
        qqBtn.setTitle("", for: .normal)
        qqBtn.setImage(UIImage.init(named: "login_icon_qq"), for: .normal)
        qqBtn.addTarget(self, action: #selector(phoneLoginBtnClick(sender:)), for: .touchUpInside)
        self.view.addSubview(qqBtn)
        qqBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-45)
            make.centerY.width.height.equalTo(wechatBtn)
        }
        
        protocolV = MSLoginProtocolView.init(frame: CGRect.init(x: 0, y: 0, width: 375, height: 50))
        self.view.addSubview(protocolV)
        protocolV.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(qqBtn.snp.bottom).offset(25)
            make.height.equalTo(50)
        }
    }

    
    @objc func phoneLoginBtnClick(sender: UIButton) {
        
    }
    
}
