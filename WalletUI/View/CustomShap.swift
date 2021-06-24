//
//  CustomShap.swift
//  WalletUI
//
//  Created by 张亚飞 on 2021/6/23.
//

import SwiftUI

struct CustomShap: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners , cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}


