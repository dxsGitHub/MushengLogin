//
//  MSLoginProtocolView.swift
//  MushengLoginMoudle
//
//  Created by dss on 2021/11/10.
//

import UIKit

class MSLoginProtocolView: UIView {

    ///文本框
    private var textV: UITextView!
    ///静态文本（用来给Text赋值frame）
    private var frameLab: UILabel!
    ///复选框
    private var checkBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInterface() {
        
        let protocolStr1 = "《用户协议》"
        let protocolStr2 = "《隐私政策》"
        let descrbStr = "登录代表您已同意"
        let contxtStr = descrbStr + protocolStr1 + protocolStr2
        
        frameLab = UILabel.init(frame: .zero)
        frameLab.text = contxtStr
        frameLab.isHidden = true
        frameLab.textAlignment = .center
        frameLab.font = UIFont.systemFont(ofSize: 13)
        frameLab.textColor = .white
        frameLab.contentHuggingPriority(for: .horizontal)
        frameLab.sizeToFit()
        self.addSubview(frameLab)
        frameLab.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
        }
        
        checkBtn = UIButton.init(type: .custom)
        checkBtn.setTitle("", for: .normal)
        checkBtn.setImage(UIImage.init(named: "login_icon_wechat"), for: .normal)
        checkBtn.addTarget(self, action: #selector(checkBtnClick(sender:)), for: .touchUpInside)
        self.addSubview(checkBtn)
        checkBtn.snp.makeConstraints { make in
            make.right.equalTo(frameLab.snp.left)
            make.width.height.equalTo(30)
            make.centerY.equalTo(frameLab)
        }
        
        
        let attr = NSMutableAttributedString.init(string: contxtStr)
        attr.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: NSRange.init(location: 0, length: contxtStr.count))
        attr.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red, range: NSRange.init(location: descrbStr.count, length: protocolStr1.count))
        attr.addAttribute(NSAttributedStringKey.underlineStyle, value: 1, range: NSRange.init(location: descrbStr.count, length: protocolStr1.count))
        
        attr.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red, range: NSRange.init(location: (descrbStr + protocolStr1).count, length: protocolStr2.count))
        attr.addAttribute(NSAttributedStringKey.underlineStyle, value: 1, range: NSRange.init(location: (descrbStr + protocolStr1).count, length: protocolStr2.count))
        
        
        self.layoutIfNeeded()
        textV = UITextView.init()
        textV.backgroundColor = .clear
        textV.isEditable = false
        textV.isScrollEnabled = false
        textV.textColor = .white
        textV.attributedText = attr
        textV.frame = frameLab.bounds
        self.addSubview(textV)
        textV.snp.makeConstraints { make in
            make.left.right.centerY.equalTo(frameLab)
        }
    }
    
    ///复选框点击事件
    @objc func checkBtnClick(sender: UIButton) {
        
    }
}
