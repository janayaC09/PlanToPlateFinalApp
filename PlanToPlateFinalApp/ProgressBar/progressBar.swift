//
//  ProgressBar.swift
//  Plan to Plate Sign Up
//
//  Created by DPI Student 148 on 7/8/25.
//

import SwiftUI

struct ProgressBar: View {
    var width: CGFloat = 200
    var height: CGFloat = 40
    var percent: CGFloat = 25
    var color1 : Color = .mint
    var color2 : Color = .gray
    
    
    var body: some View {
        let multiplier = width / 100
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: height, style: .continuous).frame(width: width, height: height).foregroundStyle(Color.black.opacity(0.2))
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: percent * multiplier, height: height)
                .background(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .leading, endPoint: .trailing)
                .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous)).animation(.easeInOut, value: percent)
            )
        }
        .foregroundStyle(Color.mint)
    }
}

#Preview {
    ProgressBar()
    
}

