//
//  AppConstant.swift
//  ExpandCollapseTest
//
//  Created by Krishna on 09/10/19.
//  Copyright © 2019 Krishna. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func addShadow(cornerRadius: CGFloat, opacity: Float, radius: CGFloat, offset: (x: CGFloat, y: CGFloat), color: UIColor){
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: offset.x, height: offset.y)
        self.layer.shadowRadius = radius
    }
}
