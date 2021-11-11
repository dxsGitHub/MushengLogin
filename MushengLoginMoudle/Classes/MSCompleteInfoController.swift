//
//  MSCompleteInfoController.swift
//  MushengLoginMoudle
//
//  Created by dss on 2021/11/11.
//

import UIKit
import SnapKit

///想法：一个小朋友守着看你填每一份资料
///性别选择项男女旁边都有一个动画小人标识，

class MSCompleteInfoController: UIViewController {

    ///标题
    private var titleLab: UILabel!
    
    ///头像背景
    private var avatarBgV: UIImageView!
    ///头像
    private var avatarV: UIImageView!
    
    ///昵称提示
    private var nickTipLab: UILabel!
    ///输入框
    private var nickTextV: MSLoginInputView!
    
    ///性别提示
    private var genderTipLab: UILabel!
    ///男
    private var maleBtn: UIButton!
    ///女
    private var femaleBtn: UIButton!
    
    ///年龄提示
    private var ageTipLab: UILabel!
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
        titleLab.textAlignment = .center
        titleLab.font = UIFont.boldSystemFont(ofSize: 28)
        titleLab.textColor = .white
        titleLab.sizeToFit()
        self.view.addSubview(titleLab)
        titleLab.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
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

        nickTipLab = UILabel.init(frame: .zero)
        nickTipLab.configWith(text: "昵称", textColor: .white, alignment: .center, font: UIFont.systemFont(ofSize: 14))
        self.view.addSubview(nickTipLab)
        nickTipLab.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(40)
            make.top.equalTo(avatarBgV.snp.bottom).offset(30)
        }
        
        nickTextV = MSLoginInputView.init(frame: .zero, style: .none)
        nickTextV.placeHoler = "请输入姓名"
        self.view.addSubview(nickTextV)
        nickTextV.snp.makeConstraints { make in
            make.top.equalTo(nickTipLab.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(350)
        }
        
        genderTipLab = UILabel.init(frame: .zero)
        genderTipLab.configWith(text: "性别（性别是重要信息，确定之后不可修改）", textColor: .white, alignment: .center, font: UIFont.systemFont(ofSize: 14))
        self.view.addSubview(genderTipLab)
        genderTipLab.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(40)
            make.top.equalTo(nickTextV.snp.bottom).offset(20)
        }
        
        maleBtn = UIButton.init(type: .custom)
        maleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        maleBtn.backgroundColor = .orange
        maleBtn.setContentHuggingPriority(.required, for: .horizontal)
        maleBtn.addTarget(self, action: #selector(genderBtnClickAction(sender:)), for: .touchUpInside)
        self.view.addSubview(maleBtn)
        maleBtn.snp.makeConstraints { make in
            make.top.equalTo(genderTipLab.snp.bottom).offset(5)
            make.centerX.equalToSuperview().offset(-30)
            make.width.height.equalTo(40)
        }
        
        femaleBtn = UIButton.init(type: .custom)
        femaleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        femaleBtn.backgroundColor = .orange
        femaleBtn.setContentHuggingPriority(.required, for: .horizontal)
        femaleBtn.addTarget(self, action: #selector(genderBtnClickAction(sender:)), for: .touchUpInside)
        self.view.addSubview(femaleBtn)
        femaleBtn.snp.makeConstraints { make in
            make.centerY.equalTo(maleBtn)
            make.centerX.equalToSuperview().offset(30)
            make.size.equalTo(maleBtn)
        }
        
        ageTipLab = UILabel.init(frame: .zero)
        ageTipLab.configWith(text: "生日（填写真实生日，匹配好友更合拍）", textColor: .white, alignment: .center, font: UIFont.systemFont(ofSize: 14))
        self.view.addSubview(ageTipLab)
        ageTipLab.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(40)
            make.top.equalTo(femaleBtn.snp.bottom).offset(30)
        }

        ageBtn = UIButton.init(type: .custom)
        ageBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        ageBtn.backgroundColor = .orange
        ageBtn.setContentHuggingPriority(.required, for: .horizontal)
        ageBtn.addTarget(self, action: #selector(genderBtnClickAction(sender:)), for: .touchUpInside)
        self.view.addSubview(ageBtn)
        ageBtn.snp.makeConstraints { make in
            make.top.equalTo(ageTipLab.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(350)
        }
        
        loginBtn = UIButton.init(type: .custom)
        loginBtn.setTitle("完成注册", for: .normal)
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
    
    
    ///性别按钮点击事件
    @objc func genderBtnClickAction(sender: UIButton) {
        
    }
    
    
    ///登录
    @objc func loginBtnClick(sender: UIButton) {
        let vc = MSCompleteInfoController.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
