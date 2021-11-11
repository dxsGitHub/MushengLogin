//
//  MSLoginInputView.swift
//  MushengLoginMoudle
//
//  Created by dss on 2021/11/11.
//

import UIKit

enum LoginInputStyle {
    case none
    case phone
    case code
    case password
}

class MSLoginInputView: UIView, UITextFieldDelegate {

    ///承载
    private var contentV: UIView!
    ///号码区域按钮
    private var phoneAreaBtn: UIButton!
    ///验证码
    private var codeBtn: UIButton!
    ///密码眼
    private var secretBtn: UIButton!
    ///输入框
    private var inputTF: UITextField!
    ///下划线
    private var baseLine: UIView!
    
    
    
    ///默认文字
    var inputText: String = "" {
        didSet {
            inputTF.text = inputText
        }
    }
    
    ///站位文字
    var placeHoler: String = "" {
        didSet {
            inputTF.placeholder = placeHoler
        }
    }
    
    
    init(frame: CGRect, style: LoginInputStyle = .none) {
        super.init(frame: frame)
        setupInterface(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInterface(style: LoginInputStyle) {
        contentV = UIView.init(frame: .zero)
        contentV.backgroundColor = .clear
        self.addSubview(contentV)
        contentV.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        inputTF = UITextField.init(frame: .zero)
        inputTF.placeholder = placeHoler
        inputTF.backgroundColor = .yellow
        inputTF.delegate = self
        inputTF.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        inputTF.textColor = .darkGray
        contentV.addSubview(inputTF)
        inputTF.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().inset(5)
        }
        
        if style == .phone {
            phoneAreaBtn = UIButton.init(type: .custom)
            phoneAreaBtn.setTitle("+86", for: .normal)
            phoneAreaBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            phoneAreaBtn.backgroundColor = .orange
            phoneAreaBtn.setImage(UIImage.init(named: "login_icon_tel"), for: .normal)
            phoneAreaBtn.semanticContentAttribute = .forceRightToLeft
            phoneAreaBtn.contentHorizontalAlignment = .left
            phoneAreaBtn.setContentHuggingPriority(.required, for: .horizontal)
            phoneAreaBtn.addTarget(self, action: #selector(phoneAreaBtnClick(sender:)), for: .touchUpInside)
            contentV.addSubview(phoneAreaBtn)
            phoneAreaBtn.snp.makeConstraints { make in
                make.left.equalToSuperview().inset(15)
                make.centerY.height.equalTo(inputTF)
            }
            
            inputTF.snp.remakeConstraints { make in
                make.left.equalTo(phoneAreaBtn.snp.right).offset(5)
                make.right.equalToSuperview().inset(15)
                make.bottom.equalToSuperview()
                make.top.equalToSuperview().inset(5)
            }
            
        } else if style == .code {
            codeBtn = UIButton.init(type: .custom)
            codeBtn.setTitle("发送验证码", for: .normal)
            codeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            codeBtn.backgroundColor = .orange
            codeBtn.setContentHuggingPriority(.required, for: .horizontal)
            codeBtn.addTarget(self, action: #selector(codeBtnClick(sender:)), for: .touchUpInside)
            contentV.addSubview(codeBtn)
            codeBtn.snp.makeConstraints { make in
                make.right.equalToSuperview().inset(15)
                make.centerY.equalTo(inputTF)
            }
            
            inputTF.snp.remakeConstraints { make in
                make.left.equalToSuperview().inset(15)
                make.right.equalTo(codeBtn.snp.left).offset(-5)
                make.bottom.equalToSuperview()
                make.top.equalToSuperview().inset(5)
            }
            
        } else if style == .password {
            secretBtn = UIButton.init(type: .custom)
            secretBtn.setTitle("眼睛", for: .normal)
            secretBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            secretBtn.backgroundColor = .red
            secretBtn.setContentHuggingPriority(.required, for: .horizontal)
            secretBtn.addTarget(self, action: #selector(secretBtnClick(sender:)), for: .touchUpInside)
            contentV.addSubview(secretBtn)
            secretBtn.snp.makeConstraints { make in
                make.right.equalToSuperview().inset(15)
                make.centerY.equalTo(inputTF)
            }
            
            inputTF.snp.remakeConstraints { make in
                make.left.equalToSuperview().inset(15)
                make.right.equalTo(secretBtn.snp.left).offset(-5)
                make.bottom.equalToSuperview()
                make.top.equalToSuperview().inset(5)
            }
        }
        
        baseLine = UIView.init(frame: .zero)
        baseLine.backgroundColor = .lightGray
        contentV.addSubview(baseLine)
        baseLine.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
    }
    
    
    ///手机号区域选择事件
    @objc func phoneAreaBtnClick(sender: UIButton) {
        
    }
    
    ///验证码发送事件
    @objc func codeBtnClick(sender: UIButton) {
        
    }
    
    ///密码显示事件
    @objc func secretBtnClick(sender: UIButton) {
        
    }
}
