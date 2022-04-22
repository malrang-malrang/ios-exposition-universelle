//
//  UILabel+Extension.swift
//  Expo1900
//
//  Created by 고명주 on 2022/04/21.
//

import UIKit

extension NSMutableAttributedString {
    convenience init(text: String, fontStyle: UIFont.TextStyle, letter: String?) {
        self.init(string: text)
        let font = UIFont.preferredFont(forTextStyle: fontStyle)
        self.addAttribute(.font, value: font, range: (text as NSString).range(of: letter ?? "" ))
    }
}
