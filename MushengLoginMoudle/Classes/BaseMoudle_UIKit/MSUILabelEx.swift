//
//  MSUILabelEx.swift
//  MushengLoginMoudle
//
//  Created by High on 2021/11/11.
//

import Foundation

extension UILabel {
    
    
    /// Lab赋值
    /// - Parameters:
    ///   - text: 文本
    ///   - textColor: 文本颜色
    ///   - alignment: 文本对齐
    ///   - font: 字体
    ///   - lines: 行数
    func configWith(text: String = "", textColor: UIColor, alignment: NSTextAlignment, font: UIFont, lines: Int = 0) {
        self.textColor = textColor
        self.textAlignment = alignment
        self.font = font
        self.text = (text == "") ? self.text : text
        self.numberOfLines = lines
    }
    
    
    
    /// Lab字间距 - 行间距
    /// - Parameters:
    ///   - lineSpace: 行间距
    ///   - wordSpace: 字间距
    ///   - text: 文本
    func configWordSpaceWidth(lineSpace: CGFloat, wordSpace: CGFloat, text: String) {
        let attribute = NSMutableAttributedString.init(string: text, attributes: [NSAttributedString.Key.kern : wordSpace])
        let paragrapStyle = NSMutableParagraphStyle.init()
        paragrapStyle.lineSpacing = lineSpace
        attribute.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragrapStyle, range: NSRange.init(location: 0, length: text.count))
        self.attributedText = attribute
        self.sizeToFit()
    }
    
    
    
    
    ///
}
