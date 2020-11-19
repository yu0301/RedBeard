//
//  CustomLabel.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/18.
//

import UIKit

class CustomLabel: UILabel {
    
        override init(frame: CGRect) {
            self.verticalAlignment = .Middle
            super.init(frame: frame)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
        var verticalAlignment: VerticalAlignment {
            didSet {
                self.setNeedsDisplay()
            }
        }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        
            //textRect - 字的尺寸
            //bound - label尺寸
            switch self.verticalAlignment {
            case .Top:
                textRect.origin.y = bounds.origin.y
            case .Bottom:
                print(textRect.size.height)
                textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height
            case .Middle:
                textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0
            }
            return textRect
        }
        
    override func drawText(in rect: CGRect) {
        
        //把設定好的位置丟進去
        let actualRect = self.textRect(forBounds: rect, limitedToNumberOfLines: 0)
        super.drawText(in: actualRect)
        }
}

enum VerticalAlignment {
    case Top
    case Middle
    case Bottom
}
